From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 13:57:57 +0100
Subject: [Buildroot] [PATCH 1/7] toolchain-external: CodeSourcery AMD64:
 support only one version
In-Reply-To: <1448123780-30067-1-git-send-email-romain.naour@openwide.fr>
References: <1448123780-30067-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151219135757.30f09e4d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sat, 21 Nov 2015 17:36:14 +0100, Romain Naour wrote:
> See the conclusion about external toolchains during the Buildroot
> meeting [1]:
> "In the future, we stick to a single external toolchain version. The
> Kconfig symbol should not encode the version (avoid legacy handling)"
> 
> [1] http://elinux.org/index.php?title=Buildroot:DeveloperDaysELCE2015#Report
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

I have applied patches 1, 2, 3, 4, 6 and 7 of this patch series. Could
you send patches doing the same (reducing to one version only) for
other CodeSourcery toolchains as well ?

Regarding patch 5, I don't really like the hacks needed with the
dynamic loader, and would like to see if there is a way to avoid having
those hacks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
