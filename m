From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 19:17:45 +0200
Subject: [Buildroot] [PATCH 5/6] package/gnu-efi: fix legal-info
In-Reply-To: <41ea946a815b2214044827c73815d8a171a3a939.1428252467.git.yann.morin.1998@free.fr>
References: <cover.1428252467.git.yann.morin.1998@free.fr>
 <41ea946a815b2214044827c73815d8a171a3a939.1428252467.git.yann.morin.1998@free.fr>
Message-ID: <20150405191745.3497f9a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  5 Apr 2015 18:48:26 +0200, Yann E. MORIN wrote:
> Fix a bunch of deficiencies:
>   - 'debian/copyright' does not exist.
>   - gnuefi is not GPLv2+. Only one AArch64 file has GPLv2+ headers,
>     all others have BSD-3c
>   - efilib is BSD-2c

I don't quite agree here: some ARM files are also under GPLv2+, so I
believe the whole thing really is under GPLv2+.

This is also apparently the opinion of Debian:
http://changelogs.ubuntu.com/changelogs/pool/main/g/gnu-efi/gnu-efi_3.0i-2ubuntu1/copyright.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
