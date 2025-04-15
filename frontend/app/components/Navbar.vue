<template>
	<section class="bg:#cbc8c2 fg:#272334 h:100% py:8x">
		<nav class="h:100% flex flex:col jc:space-between pt:4x">
			<ul class="f:16 flex flex:col ai:left font-weight:450">
				<li v-for="link in links"
					class="h:100% flex ai:center font-weight:700:hover bg:#b1afaa:hover fg:#7d5de5:hover br:3|#7d5de5:hover">
					<NuxtLink
						:to="`${link.url}`"
						class="w:100% py:3x px:8x gap-x:2x">
						<p class="mt:2">{{ link.name }}</p>
					</NuxtLink>
				</li>
			</ul>
		</nav>
	</section>
</template>

<script setup lang="ts">
	interface Link {
		name: string;
		url: string;
	}

	const links: Link[] = [
		{
			name: 'Home',
			url: '/',
		},
		{
			name: 'Registration Form',
			url: '/registration'
		},
		{
			name: 'Truck Drivers',
			url: '/drivers'
		}
	];
</script>
