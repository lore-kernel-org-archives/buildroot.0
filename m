From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Nov 2014 11:01:16 +0100
Subject: [Buildroot] [git commit] arch/Config.in.x86: drop
 BR2_x86_generic
In-Reply-To: <20141107185346.68E2FB2F56@busybox.osuosl.org>
References: <20141107185346.68E2FB2F56@busybox.osuosl.org>
Message-ID: <20141108110116.22dd9c53@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Fri, 7 Nov 2014 19:51:06 +0100, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=80e406090893ab5a7b5d78e4d243d12fca2b22fb
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> The fuzzy generic x86 variant doesn't make much sense in the context of
> Buildroot, and the recent change to use -march instead of -mtune broke it.

No Config.in.legacy handling?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
