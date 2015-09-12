From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Sep 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-11
Message-ID: <20150912063017.0EBCC10190C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-11
===============================

        success : 213
       failures : 62 
       timeouts : 0  
          TOTAL : 275

Classification of failures by reason
====================================

                host-gdb-7.9.1 | 13
                directfb-1.7.7 | 5 
libbroadvoice-f65b0f50c8c76... | 4 
libyuv-1ebf86795cb213a37f06... | 4 
                  mono-4.0.2.5 | 4 
                     gdb-7.9.1 | 3 
                   erlang-17.5 | 2 
              strongswan-5.3.3 | 2 
                 qt5base-5.5.0 | 2 
                  boost-1.58.0 | 2 
                busybox-1.23.2 | 2 
            gst-ffmpeg-0.10.13 | 1 
                  guile-2.0.11 | 1 
                    vtun-3.0.3 | 1 
                 sudo-1.8.14p3 | 1 
                minidlna-1.1.4 | 1 
                 mesa3d-10.6.7 | 1 
               iptables-1.4.21 | 1 
                    ruby-2.2.3 | 1 
            ibrdtn-tools-1.0.1 | 1 
                 setools-3.3.8 | 1 
                   bdwgc-7.4.2 | 1 
                oprofile-1.0.0 | 1 
                    iostat-2.2 | 1 
                 mplayer-1.1.1 | 1 
               linknx-0.0.1.32 | 1 
                   slang-2.3.0 | 1 
             stress-ng-0.04.16 | 1 
                   tinc-1.0.24 | 1 
                   perl-5.22.0 | 1 

Detail of failures
===================

       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/f9ad0f73cb12d5acc25b07b6a3246f3888e8942a/
       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/af40ac3fdb74f49ca8d5f60de6e146fc7e6db5f8/
       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/6b181a899f87027c406d8b2efcc0e5904931725d/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/a738c6288d889790b0c8bb6b200a39fc5b562716/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/59ae0be994127e71eb17811a6e4b08261fe06fce/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/5f8699c78983b9e96f1853947faeec6ee1bb0889/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/5bf8a7f2522ae71f84d281cab604c255fe6f2f5c/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/f160f5c312a0b3437fd89f275ac4e7d0d358ed81/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/d2f58255d48037c0aa2757aa6a72cb07f6a0a44a/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/8c7901fffeafb3b475d6074f4d78caf153baac8c/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/a3b5cdf2069d5558c5169be88f428f6c14d1868b/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/88cedc2defbb88d242c5c58558efb16acd70db87/
        i686 |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/63f6324742e091d7a9edda0e6a425b44e6ebc499/
      x86_64 |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/236cdc0caea9ec22e640e11ffe56ce09f7f73338/
    mips64el |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/904746420097ce3b042b3d851fecfca2f5f13f2e/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/811dd9fc84811ed18c52f59de90dec5ec74aa42d/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/1b4297a1d17d2064de2d09f617793d05f0ae685d/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/b52da99f4781dd06ff6679c0e8b2fce28a3357f6/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/5923711c2d906b6950ecff3f10ddf588605e5399/
      x86_64 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/d216ca06871554b0d5bf267317d82b8ba6b5654c/
      xtensa |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/1993d3769d88945ba4b8f88eeee747c2dc9d4a22/
        bfin |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/affe11cf709b12729bd7475a9690163af9404f8f/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/968cb98302c01fd206db65dfb412073b1ee017bc/
        bfin |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/886c25bca760bde3548c7784a640a1377c9a582c/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/4c9d1aaf305593d2f5ae23fc0cfe8249ccbf09d2/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/52798d9d3900f34fc4b1d40dd71f5211dbf14561/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/be52961fd66047c0d3a4da1bfd8bbc517e9502b1/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/ad69b3dbfdedf7fc5cd01a1ade1d4a088454de60/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/777a9c321a3367ea097786c25ed98e131433859f/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/76b8d4172b930eba5478ba396b56aa1cffbb4cbf/
         arm |             ibrdtn-tools-1.0.1 | NOK | http://autobuild.buildroot.net/results/d36ccc1c00e769408b40707a6adf9ced63435535/
      x86_64 |                     iostat-2.2 | NOK | http://autobuild.buildroot.net/results/815c2ca39d143a8c9f1a1d6f7a47b60316ae7d80/
         arm |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/82fda6145ad39443bbce0610b5305a9c9121931c/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/3fb0acdfeca1f8b917515027bd28dbbe8558e2e3/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/0b6eae850bc69107814cd2afc273a03d30b21f5b/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/c4b3861906e30dec849baaec370cd598fe4371ac/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/673fc02df0aefc2025973a6315877edff49d2c3c/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/1a573e07898bfb8929d7b28ffc551a968833f176/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/6a1a9add6e173791ce137f9f0b2be86d13eac631/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/7363b388be5df9424f70d89d6528c40106a460f4/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/6a19d99fbcd2fc3f64e5977b17798208490371df/
      xtensa |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/ff64799cdcbc2d35d4016b4e11933baa15dd9e06/
     aarch64 |                  mesa3d-10.6.7 | NOK | http://autobuild.buildroot.net/results/43a4892e008653c4459399301a2ec42d292c2050/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/9824688c1b44acfeb953cd76229e62ee652362bc/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/2db8b345caf403578ded8dd36ad6f9aa3b317262/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/77b6cecbd5923c7a12c91155be2c30aea657cf19/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/0c216ae0847e5b67ab304f4cae4bcbacbb0f0ac6/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/77a091e0ccb931fec8c9940b159cd62dce2528fc/
      xtensa |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/9a0c03ab3ee5a9dd1adbb30619204afdafbe18c2/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/fe0451af90ca22e640f735a29cdc39c69e208514/
     powerpc |                    perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/c2a6e7f8b0e41277028eb100eb27eadeb66994f5/
    mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/697867a1faa1855d296a999e128d1698824ec265/
    mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/7d7486b5f34087bb26bf9f57ac76fef9eaf1f08a/
         arm |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/8fe8787f2212cd8b648d863a26a0718ed3fcbad7/
        i686 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/a91a8e56129088ac5c6536aca02e3ba87fac9c3e/
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/f92849715f04476c14050ac741d740f8493a29c8/
         arm |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/ec18a1a5b65436f8e0a3106ec880a18c9fb3b4a3/
     powerpc |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/6c6172065736441cf6267c8a64914e34859cf3cf/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/c537ea79f43498de4940599daacee70362219a83/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/1c28ab72b7a242c08c45d203a0f426d6206a80f2/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/e8dbdc4ec6d43db76c3fedd002b1b7df79319934/
         arm |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/ab01f8e0467e85322c63b81bb7e84fd251e5d556/


-- 
http://autobuild.buildroot.net
