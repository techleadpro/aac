<template>
	<CSSRuntimeProvider :config="import('./master.css')">
		<NuxtLayout>
			<NuxtPage />
		</NuxtLayout>
	</CSSRuntimeProvider>
</template>

<script setup lang="ts">
	import { defineAsyncComponent } from 'vue';
	const CSSRuntimeProvider = defineAsyncComponent(async () =>
		(await import('@master/css.vue')).CSSRuntimeProvider);

	useHead({
		title: 'Car Dash',
		meta: [
			{
				name: 'title',
				content: 'Car Dash'
			},
			{
				name: 'description',
				content: 'Car Registration System'
			},
		],
		link: [
			{ rel: 'preconnect', href: 'https://fonts.googleapis.com' },
			{ rel: 'preconnect', href: 'https://fonts.gstatic.com' },
			{ rel: 'icon', type: 'image/png', href: '/favicon.ico' },
			{ rel: 'stylesheet', href: 'https://cdn.master.co/normal.css' },
			{ rel: 'stylesheet', href: 'https://fonts.googleapis.com/css2?family=Figtree:ital,wght@0,300..900;1,300..900&display=swap' }
		],
		htmlAttrs: {
			lang: 'en'
		}
	});

	const date = new Date();
</script>

<style lang="css">
	:root {
		font-family: 'Figtree', sans-serif;
		font-feature-settings: 'liga' 1, 'calt' 1;
		font-optical-sizing: auto;
		font-weight: normal;
		/* fix for Chrome */
	}

	@supports (font-variation-settings: normal) {
		:root {
			font-family: 'Figtree', sans-serif;
		}
	}

	body {
		background-color: #F3F1ED;
		/* #202020; #CFCACE */
		color: #272334;
		max-height: 100vh;
		max-height: 100svh;
		-webkit-font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
		overflow: hidden;
		box-sizing: border-box;
	}
</style>