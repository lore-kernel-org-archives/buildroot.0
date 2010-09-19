From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 19 Sep 2010 14:29:17 +0200
Subject: [Buildroot] [PATCH 2/2] updated xfsprogs to version 3.1.3
In-Reply-To: <1284884475-2390-3-git-send-email-marcus.osdoba@googlemail.com>
References: <1284884475-2390-1-git-send-email-marcus.osdoba@googlemail.com>
	<1284884475-2390-3-git-send-email-marcus.osdoba@googlemail.com>
Message-ID: <20100919122916.GA28625@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marcus,

On Sun, Sep 19, 2010 at 10:21:15AM +0200, Marcus Osdoba wrote:
> this version needs some uuidlibrary
> it works with the one of e2fsprogs xor util-linux-ng
> 
> xfs is known to have problems on architectures with VIVT cache like ARM

ARM9 and Xscale, that is. ARM11 and Cortex-A8/9 have VIPT (L1) cache.

baruch


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
