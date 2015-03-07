From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 14:19:03 +0100
Subject: [Buildroot] [PATCH 08/10 v7] package/nvidia-tegra23-binaries:
 new package
In-Reply-To: <20150307130141.GB4186@free.fr>
References: <cover.1423597914.git.yann.morin.1998@free.fr>
 <af61ad6f5736862b334002ce47727c9ce3bb2ab3.1423597914.git.yann.morin.1998@free.fr>
 <20150221234636.50616706@free-electrons.com>
 <20150221225836.GB4246@free.fr>
 <20150223124136.5fb4ea97@nserafini-N550JK>
 <54F7898A.6090601@free.fr> <20150306231558.GE4220@free.fr>
 <20150307090354.60c844a3@free-electrons.com>
 <20150307130141.GB4186@free.fr>
Message-ID: <20150307141903.4a4c3b4f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 7 Mar 2015 14:01:42 +0100, Yann E. MORIN wrote:

> Given the feedback from Bernd, I'll see at adding such a version choice.
> 
> Let's say we go this route:
> 
>   - add a version choice for 1.14.7 (for tegra-binaries) and 1.17.1 (the
>     current version), defaulting to 17.1;
> 
>   - add hidden symbols for the driver ABI supported by each version;
> 
>   - make nvidia-tegra23 depend on the appropriate ABI symbol.
> 
> OK?

Seems OK to me. Though it would be good if someone can actually test
the patches. I don't know when I'll have the time to test on the Tegra
3 platform.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
