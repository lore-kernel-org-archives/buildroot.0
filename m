From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 12 May 2020 16:26:56 +0200
Subject: [Buildroot] [PATCH 0/1] Fix GCC 9.3.0 failing to build because
 of self tests
In-Reply-To: <AM0PR10MB241730612D4A254D0BBA4543AABE0@AM0PR10MB2417.EURPRD10.PROD.OUTLOOK.COM>
References: <AM0PR10MB241730612D4A254D0BBA4543AABE0@AM0PR10MB2417.EURPRD10.PROD.OUTLOOK.COM>
Message-ID: <35d7cfea-fdd0-8cdd-9227-4fed0f531cca@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ben,

Le 12/05/2020 ? 14:46, Ben Dakin-Norris a ?crit?:
> Hi,
> 
> ?
> 
> This patch enables GCC 9.3.0 to build as a toolchain only
> 
> ?
> 
> The build will report an error xgcc: No such file or directory otherwise

Sorry but I don't understand what's the issue you are trying to fix.
I've built some gcc 9.x toolchain without any issue.
Can you give some details please.

Best regards,
Romain


> 
> ?
> 
> Regards,
> 
> ?
> 
> Ben
> 
> ?
> 
> Benedict Dakin-Norris (1):
> 
> ? Remove SELFTEST_TARGETS from GCC 9.3.0
> 
> ?
> 
> .../gcc/9.3.0/0004-gcc-remove-selftest-targets.patch? | 11 +++++++++++
> 
> 1 file changed, 11 insertions(+)
> 
> create mode 100644 package/gcc/9.3.0/0004-gcc-remove-selftest-targets.patch
> 
> ?
> 
> --
> 
> 2.25.1
> 
> Ben Dakin-Norris?
> Software Engineer
> Navtech Radar Limited <https://www.navtechradar.com>
> Navtech Radar Limited
> Home Farm, Ardington, Wantage, Oxfordshire, OX12 8PD, UK
> ??+44 (0)1235 832419
> ??ben.dakin-norris at navtechradar.com
> LinkedIn <https://www.linkedin.com/company/navtech-radar-ltd/> 	Twitter
> <https://twitter.com/Navtechradar> 	YouTube
> <https://www.youtube.com/user/NavtechRadar> 	Instagram
> <https://www.instagram.com/navtechradar/> 	Facebook
> <https://www.facebook.com/navtechradar>
> 
> Navtech Radar Ltd registered in England & Wales No: 3699400. Vat No: 742071067
