// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
	compatibilityDate: '2024-11-01',
	future: {
		compatibilityVersion: 4,
	},
	experimental: {
		sharedPrerenderData: false,
		compileTemplate: true,
		resetAsyncDataToUndefined: true,
		templateUtils: true,
		relativeWatchPaths: true,
		defaults: {
			useAsyncData: {
				deep: true
			}
		}
	},
	devtools: {
		enabled: true,
		componentInspector: false
	},
	modules: ['@master/css.nuxt', '@nuxt/image'],
	components: [{
		path: '~/components',
		pathPrefix: false,
	}]
})