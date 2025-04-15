<template>
	<section class="fixed top:0 left:0 w:100% bg:#272334 fg:#CFCACE h:64 px:8x z:100">
		<div class="h:100% flex jc:space-between ai:center">
			<div class="flex ai:center gap-x:4x">
				<NuxtImg
					src="/logo.png"
					format="webp"
					quality="95"
					class="h:28" />
				<h1 class="f:8x uppercase font-weight:800 cursor:default">CAR DASH</h1>
				<p class="f:4x opacity:.5">|| Automobile Registration System</p>
			</div>
			<div class="flex ai:center gap-x:3x">
				<div class="flex ai:center gap-x:3x cursor:pointer">
					<div
						class="rel size:38|38 flex ai:center jc:center outline:1.5|#32d04e r:full">
						<NuxtImg
							src="/images/profile.jpg"
							format="webp"
							quality="95"
							class="size:32|32 obj:cover r:full" />
						<div
							class="abs bottom:-1 right:0 size:12|12 bg:#202020 flex ai:center jc:center r:full">
							<div class="size:8|8 bg:#32d04e r:full"></div>
						</div>
					</div>
					<div>
						<p class="f:14">Nii Ghana</p>
					</div>
				</div>
			</div>
		</div>
	</section>
</template>

<script setup lang="ts">
	function showAlert() {
		window.alert('updates');
	}
</script>

<style scoped></style>