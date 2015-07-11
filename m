From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 15:04:25 +0200
Subject: [Buildroot] [PATCH 0/2] package/lame: Fix compile on 32bit
 Intel with gcc-4.9.x
In-Reply-To: <1428746257-29810-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428746257-29810-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150711150425.70ce1f44@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 11 Apr 2015 11:57:35 +0200, Bernd Kuhls wrote:

> this patch series supersedes
> http://patchwork.ozlabs.org/patch/380574/
> http://patchwork.ozlabs.org/patch/385267/
> 
> The first patch allows to autoreconf lame which is needed for the second patch
> which really fixes the compile bug.
> 
> Regards, Bernd
> 
> Bernd Kuhls (2):
>   package/lame: Fix autoreconf
>   package/lame: Fix compile on 32bit Intel

Applied the patches, thanks! I've tried to use the latest CVS from
Lame, but it doesn't have the -msse fix and it doesn't autoreconf
properly either.

Could you submit the patches upstream? There is one guy that seems to
be active, he even has an unofficial Github mirror.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
