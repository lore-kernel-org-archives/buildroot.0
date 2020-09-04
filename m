From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 17:21:19 +0200
Subject: [Buildroot] [PATCH v2] package/libzip: add patch from upstream
 to fix build
In-Reply-To: <20200904141839.29071-1-paul@crapouillou.net>
References: <20200904141839.29071-1-paul@crapouillou.net>
Message-ID: <20200904172119.7d25a9e8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  4 Sep 2020 16:18:39 +0200
Paul Cercueil <paul@crapouillou.net> wrote:

> Cherry-pick a patch from upstream project that fixes the build when used
> with a uClibc based toolchain.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Could you provide a reasonably minimal defconfig that exhibits the
issue? I'm not able to reproduce. libzip alone, or libzip + openssl
builds fine here with a uClibc pre-built toolchain.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
