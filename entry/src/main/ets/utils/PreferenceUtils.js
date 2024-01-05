import preferences from '@ohos.data.preferences';
class PreferenceUtil {
    constructor() {
        this.prefMap = new Map();
    }
    async loadPreference(context, name) {
        try {
            let pref = await preferences.getPreferences(context, name);
            this.prefMap.set(context, pref);
            console.log('加载成功');
        }
        catch (e) {
        }
    }
    async putPreferenceValue(name, key, value) {
        if (this.prefMap.has(name)) {
            let pref = this.prefMap.get(name);
            await pref.put(key, value);
            await pref.flush();
        }
    }
    async getPreferenceValue(name, key, defaultValue) {
        if (this.prefMap.has(name)) {
            let pref = this.prefMap.get(name);
            let data = await pref.get(key, defaultValue);
            console.log('获取到 data', data);
            return data;
        }
    }
}
const preferenceUtil = new PreferenceUtil();
export default preferenceUtil;
//# sourceMappingURL=PreferenceUtils.js.map