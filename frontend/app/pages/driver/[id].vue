<template>
	<section class="rel size:100%|100% z:999">
		<div class="size:100%|100% p:8x">
			<div class="bg:white w:500 h:100% r:4x">
				<h2 class="f:8x font-weight:800 pt:8x pl:8x">Driver Information:</h2>
				<div class="py:12x px:8x mb:8x>div f:8x>div>p">
					<div class="">
						<label>Full Name</label>
						<p>{{ personel?.full_name }}</p>
					</div>

					<div class="">
						<label>Email</label>
						<p>{{ personel?.email }}</p>
					</div>

					<div class="">
						<label>Phone</label>
						<p>{{ personel?.phone }}</p>
					</div>

					<div class="">
						<label>Truck Type</label>
						<p>{{ personel?.truck_type }}</p>
					</div>

					<div v-if="personel?.truck_data">
						<label class="">Documents</label>
						<div class="mt:2x">
							<a :href="documentUrl" target="_blank" class="text-decoration:underline">
								<!-- Show image for image files -->
								<NuxtImg
									v-if="isImage"
									:src="documentUrl"
									alt="Truck Document"
									class="w:80% pt:2x obj:cover" />

								<!-- Show PDF icon/text for PDF files -->
								<div v-if="isPDF" class="bg:#f5f5f5 p:4x r:2x">
									<span class="fg:#7d5de5">
										<i class="fas fa-file-pdf mr:2x"></i> View PDF Document
									</span>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</template>

<script setup lang="ts">
	const route = useRoute();

	interface Personel {
		id: string;
		full_name: string;
		email: string;
		phone: string;
		truck_type: string;
		truck_data?: string;
	}

	const personel = ref<Personel | null>(null);

	onMounted(async () => {
		try {
			const { data, error } = await useFetch(`https://driver-api-5yas.onrender.com/api/v1/drivers/${route.params.id}`);

			if (error.value) {
				console.error('Error:', error.value);
				return;
			}

			if (data.value) {
				personel.value = data.value as Personel;
			}
		} catch (err) {
			console.error('Error:', err);
		}
	});

	const documentUrl = computed(() => {
		if (!personel.value?.truck_data) return undefined;
		return personel.value.truck_data;
	});

	const isImage = computed(() => {
		if (!personel.value?.truck_data) return false;
		return personel.value.truck_data.startsWith('data:image');
	});

	const isPDF = computed(() => {
		if (!personel.value?.truck_data) return false;
		return personel.value.truck_data.startsWith('data:application/pdf');
	});
</script>

<style scoped>
	section {
		overflow: hidden;
	}

	label {
		font-weight: bold;
		color: #9b9199;
		text-transform: uppercase;
	}
</style>