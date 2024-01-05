import preferences from '@ohos.data.preferences';

class PreferenceUtil {
  prefMap: Map<string, preferences.Preferences> = new Map()

  async loadPreference(context, name: string) {
    try {
      let pref = await preferences.getPreferences(context, name)
      this.prefMap.set(context, pref)
      console.log('加载成功');
    } catch (e) {
    }
  }

  async putPreferenceValue(name: string, key: string, value: preferences.ValueType) {
    if (this.prefMap.has(name)) {
      let pref = this.prefMap.get(name)
      await pref.put(key, value)
      await pref.flush()
    }
  }

  async getPreferenceValue(name: string, key: string, defaultValue: preferences.ValueType) {
    if (this.prefMap.has(name)) {
      let pref = this.prefMap.get(name)
      let data=await pref.get(key, defaultValue)
      console.log('获取到 data',data);
      return data
    }
  }
}

const preferenceUtil = new PreferenceUtil()

export default preferenceUtil as PreferenceUtil