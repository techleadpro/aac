<template>
	<div>
		<div class="size:100%|100% p:8x">
			<div class="bg:white w:500 h:100% r:4x">
				<div class="py:12x px:8x">
					<h1 class="f:8x font-weight:800 pt:2x">Truck Drivers</h1>
					<ul class="pt:4x">
						<li
							v-for="driver in drivers" :key="driver.id"
							class="flex h:100% ai:center py:2x px:1x mb:1x cursor:pointer bg:black/.05:hover {f:6x;font-weight:700}>a>p">
							<NuxtLink
								:to="`/driver/${driver.id}`"
								class="w:100% h:100%">
								<p class="opacity:.70">{{ driver.full_name }}</p>
								<label class="fg:#9b9199 f:15">{{ driver.email }}</label>
							</NuxtLink>

							<button
								@click="deleteDriver(driver.id)"
								class="bg:#e37070 bg:#c64f4f:hover fg:white block w:max-content py:.5x px:3x r:1x cursor:pointer">
								<span class="f:11 uppercase">Delete</span>
							</button>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</template>

<script setup lang="ts">
	const drivers = ref<any[]>([]);

	const { data, refresh, error } = useAsyncData(
		'drivers',
		() => $fetch('https://driver-api-5yas.onrender.com/api/v1/drivers/')
	);

	// Watch for data changes and update the drivers ref
	watch(data, (newData) => {
		if (newData) {
			drivers.value = Array.isArray(newData) ? newData : [];
		}
	}, { immediate: true });

	async function deleteDriver(id: string) {
		try {
			const { error } = await useFetch(`https://driver-api-5yas.onrender.com/api/v1/drivers/${id}`, {
				method: 'DELETE',
			});

			if (error.value) {
				console.error('Error deleting driver:', error.value);
				return;
			}

			// Remove the deleted driver from the local state
			drivers.value = drivers.value.filter(driver => driver.id !== id);

			// Simply call refresh to fetch updated data
			refresh();

		} catch (err) {
			console.error('Error:', err);
		}
	} 
</script>

<style lang="css">
	.person {
		background-color: bisque;
	}
</style>