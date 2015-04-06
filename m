From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 10:57:26 +0200
Subject: [Buildroot] [PATCHv2] package/gnu-efi: fix legal-info
In-Reply-To: <1428256135-16455-1-git-send-email-yann.morin.1998@free.fr>
References: <1428256135-16455-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150406105726.3f2341a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  5 Apr 2015 19:48:55 +0200, Yann E. MORIN wrote:
> Fix a bunch of deficiencies:
>   - 'debian/copyright' does not exist.
>   - gnuefi is not GPLv2+. Only one AArch64 file has GPLv2+ headers,
>     all others have BSD-3c
>   - efilib is BSD-2c
> 
> Change the licensing information to include BSD-3c for the gnuefi parts,
> and keep refernce to GPLv2+ as the Main README.gnuefi references it.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
