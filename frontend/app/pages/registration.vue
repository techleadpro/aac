<template>
	<section class="rel size:100%|100% z:999">
		<div class="size:100%|100% p:8x">
			<div class="bg:white w:500 h:100% r:4x">
				<h1 class="f:8x font-weight:800 pt:8x pl:8x">Registration</h1>
				<form
					@submit.prevent="SubmitForm"
					class="py:12x px:8x flex flex:col gap-y:9x {w:100%;flex;flex:col;gap:2x}>div">
					<div>
						<label>Full Name:</label>
						<input v-model="personel.full_name" type="text" class="p:3x outline:1|solid|lightgray r:1x"
							placeholder="Nii Ghana" />
					</div>
					<div>
						<label>Email:</label>
						<input v-model="personel.email" type="text" class="p:3x outline:1|solid|lightgray r:1x"
							placeholder="you@me.com" />
					</div>
					<div>
						<label>Phone Number:</label>
						<input v-model="personel.phone" type="text" class="p:3x outline:1|solid|lightgray r:1x"
							placeholder="+233 123 456 789" />
					</div>
					<div>
						<label>Truck Type:</label>
						<select v-model="personel.truck_type" class="p:3x outline:1|solid|lightgray r:1x">
							<option value="Pickup Truck">Pickup Truck</option>
							<option value="Box Truck">Box Truck</option>
							<option value="Semi-trailer Truck">Semi-trailer Truck</option>
							<option value="Refrigerator Truck">Refrigerator Truck</option>
							<option value="Tank Truck">Tank Truck</option>
							<option value="Flatbed Truck">Flatbed Truck</option>
						</select>
					</div>
					<div>
						<label>Upload ID / Truck Document:</label>
						<input
							type="file"
							@change="HandleFileUpload"
							class="py:9 px:3x outline:1|solid|lightgray r:1x bg:#f2f2f2 fg:#999 {bg:#e0e0e0;fg:#454545;r:1x;mr:4x;b:0;outline:1|solid|#c7c7c7;py:1x;px:8x}::file-selector-button" />
					</div>
					<button
						:disabled="!isFormValid"
						class="w:100% bg:#7d5de5 fg:white r:1x py:3x px:9x font:16 b:0 cursor:pointer bg:#6047b1:hover">
						Add Personel
					</button>
				</form>
			</div>
		</div>
	</section>
</template>

<script setup lang="ts">
	const personel = ref({
		id: '',
		full_name: '',
		email: '',
		phone: '',
		truck_type: '',
		truck_data: ''
	});


	const isFormValid = computed(() => {
		return (
			personel.value.full_name.trim() !== '' &&
			personel.value.email.trim() !== '' &&
			personel.value.phone.trim() !== '' &&
			personel.value.truck_type.trim() !== ''
		);
	});

	async function HandleFileUpload(event: Event) {
		const file = (event.target as HTMLInputElement).files?.[0];
		if (file) {
			// Convert file to base64
			const reader = new FileReader();
			reader.onload = (e) => {
				personel.value.truck_data = e.target?.result as string;
			};
			reader.readAsDataURL(file);
		}
	}

	async function SubmitForm() {
		try {
			const { data, status, error } = await useFetch('https://driver-api-5yas.onrender.com/api/v1/drivers/', {
				method: 'POST',
				body: personel.value,
				headers: {
					'Content-Type': 'application/json'
				}
			});

			if (error.value) {
				console.error('Error:', error.value);
				return;
			}

			if (status.value === 'success') {
				console.log('Success:');
				personel.value = {
					id: '',
					full_name: '',
					email: '',
					phone: '',
					truck_type: '',
					truck_data: ''
				};
				navigateTo('/drivers');
			}
		} catch (err) {
			console.error('Error:', err);
		}
	}
</script>

<style scoped>
	label {
		font-weight: bold;
		color: #9b9199;
		text-transform: uppercase;
	}

	button:disabled {
		opacity: 0.5;
		cursor: not-allowed;
		background-color: #ccc !important;
	}

	::placeholder {
		opacity: 0.45;
	}
</style>