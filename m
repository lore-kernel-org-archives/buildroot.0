From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Feb 2019 09:10:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/brcm-patchram-plus: bump to
 version 95b7b6916d661a4da3f9c0adf52d5e1f4f8ab042
In-Reply-To: <20190210172739.30412-1-fontaine.fabrice@gmail.com>
References: <20190210172739.30412-1-fontaine.fabrice@gmail.com>
Message-ID: <20190211091057.369479a2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sun, 10 Feb 2019 18:27:39 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove patch (already in version)
> - Use COPYING as license file as COPYING has been fixed by:
>   https://github.com/AsteroidOS/brcm-patchram-plus/commit/95b7b6916d661a4da3f9c0adf52d5e1f4f8ab042
> 
> This bump will also fix build failure of brcm-patchram-plus-legal-info
> due to the fact that src/main.c was used as the license file but also
> patched by 0001-src-main.c-fix-build-on-SPARC.patch
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a13abf28094e182060712727d0aa72d3644f0283

Actually, this problem was already fixed in commit
35dde6de1fc23bcc5a56eed30cac46d201b7104a, which your commit is based on
(you have the right hash for src/main.c in your commit).

So I've dropped this part of the commit log, and applied to master.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
