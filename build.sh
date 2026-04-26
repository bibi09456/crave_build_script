#git config --global user.name bibi09456
#git config --global user.email 55490658+bibi09456@users.noreply.github.com
#rm -rf device/xiaomi/rodin
#rm -rf device/lineage/sepolicy
#rm -rf frameworks/native
rm hardware/ril/reference-ril/telephony
cd device/xiaomi/rodin && git restore framework_compatibility_matrix.xml
cd ../../..
rm -rf .repo/local_manifests/ && repo init -u https://github.com/LineageOS/android.git -b lineage-23.2 --git-lfs && git clone https://github.com/bibi09456/local_manifests --depth 1 -b rodin .repo/local_manifests && /opt/crave/resync.sh && repo forall -c git lfs pull
#cd frameworks/native && curl https://github.com/pos-xyz-personal/frameworks_native/commit/9b1091664329d9b8055d246210cf442b8d7eb5da.patch | git am && cd ../..
#sed -i '/vendor_camera_prop/d' device/lineage/sepolicy/common/private/property_contexts
#sed -i 's/OS2.0.204.0.VOJMIXM/OS2.0.205.0.VOJMIXM/' $(grep -rnwl device/xiaomi/rodin -e 'OS2.0.204.0.VOJMIXM')
#sed -i '$d' device/xiaomi/rodin/lineage_rodin.mk
#perl -pi -e 'chomp if eof' device/xiaomi/rodin/lineage_rodin.mk
#echo -e " \\\\\n    RisingChipset=\"Dimensity 8400-Ultra\" \\\\\n    RisingMaintainer=\"bibi094\"\n\nWITH_GMS := false\nWITH_MICROG := true\nRISING_MAINTAINER=\"bibi094\"\nRISING_MAINTAINER := bibi094" | tee -a device/xiaomi/rodin/lineage_rodin.mk
#cd hardware/ril/reference-ril && ln -s ../include/telephony && cd ../../..
#sed -i '/<\/compatibility-matrix>/i\  <hal format="aidl">\n    <name>vendor.xiaomi.hardware.batteryantiaging</name>\n    <version>1</version>\n    <interface>\n      <name>IBatteryAntiAging</name>\n      <instance>default</instance>\n    </interface>\n  </hal>\n  <hal format="aidl">\n    <name>vendor.xiaomi.hardware.micharge</name>\n    <version>2</version>\n    <interface>\n      <name>IMiCharge</name>\n      <instance>default</instance>\n    </interface>\n  </hal>' device/xiaomi/rodin/framework_compatibility_matrix.xml
sed -i 's/v0.3.13.250932/v0.3.15.250932/g' vendor/partner_gms/.microg_release
sed -i 's/250932026/250932030/g' vendor/partner_gms/GmsCore/.version_code
sed -i 's/84022626/84022630/g' vendor/partner_gms/FakeStore/.version_code
export BUILD_USERNAME=bibi09456
export BUILD_HOSTNAME=crave
export TZ=Asia/Jakarta
export WITH_GMS=true
export TARGET_SHIPS_DOLBY=true
source build/envsetup.sh && lunch lineage_rodin-bp4a-userdebug && mka installclean && mka bacon
