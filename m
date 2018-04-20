From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Apr 2018 13:37:42 +0200
Subject: [Buildroot] [PATCH 0/4] openjdk
In-Reply-To: <20180206143952.12332-1-thomas.de_schampheleire@nokia.com>
References: <20180206143952.12332-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180420133742.3d20ee49@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Feb 2018 15:39:48 +0100, Thomas De Schampheleire wrote:

> This series is the result of some effort that was spent in the past to get
> openjdk build without crazy dependencies on e.g. X11, cups, etc. if all you need
> is some basic Java.
> It was made in the context of PowerPC on an older Buildroot release.
> 
> This series is sent not so much for immediate integration in mainline
> Buildroot, but rather to help others that are interested in openjdk support.
> They could use this series as a starting point and possibly improve it.
> 
> The openjdk variant used is Zero.
> In order to build the more performant Zero Shark, one needs LLVM JIT.
> 
> The size optimization patches may need to be converted in actual config options,
> as not all use cases may desire them.

I'm wondering what to do with this patch series. Thomas DS says it is
not really ready for integration, and was mainly sent to help others
who might be interested in OpenJDK.

Is there anyone interested in picking up this patch series and fixing
the remaining issues ?

Does anyone disagrees with marking those patches as "Changes Requested"
in patchwork ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
