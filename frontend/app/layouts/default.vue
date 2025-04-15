<template>
	<main class="rel max-vw">
		<HeaderComp />
		<div class="flex mt:64">
			<section class="h:calc(100vh-64px) w:300 flex">
				<div class="flex:1">
					<Navbar />
				</div>
			</section>
			<section class="rel flex:1">
				<slot />
				<NuxtImg
					src="/images/road-background.jpg"
					format="webp"
					quality="95"
					class="abs top:0 left:0 size:100%|100% obj:cover z:-1 opacity:.45" />
			</section>
		</div>
	</main>
</template>

<style>
	.info {
		background-image: url(../../public/images/road-background.jpg);
	}
</style>