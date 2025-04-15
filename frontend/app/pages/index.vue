<template>
	<section class="rel size:100%|100% z:999">
		<div class="size:100%|100% p:8x">
			<div class="bg:white w:500 h:max-content pb:8x r:4x">
				<h2 class="f:8x font-weight:800 pt:8x pl:8x">Welcome</h2>
				<div class="f:5x mt:4x pl:8x">
					<p>This is the Car Dash App!</p>
					<p>
						Please head to the registration page to register a personel
					</p>
					<NuxtLink
						to="/registration"
						class="mt:8x bg:#7d5de5 bg:#6047b1:hover fg:white block w:max-content py:2x px:9x r:1x cursor:pointer">
						<p class="f:13 uppercase">Register Personel</p>
					</NuxtLink>
				</div>
			</div>
		</div>
	</section>
</template>

<script setup lang="ts">

</script>

<style scoped>
	section {
		overflow: hidden;
	}
</style>