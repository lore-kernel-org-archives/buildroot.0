From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Oct 2018 14:54:43 +0200
Subject: [Buildroot] [PATCH 1/1] x265: disable parallel build
In-Reply-To: <20181001205739.27140-1-fontaine.fabrice@gmail.com>
References: <20181001205739.27140-1-fontaine.fabrice@gmail.com>
Message-ID: <20181003145443.69bae932@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 Oct 2018 22:57:39 +0200, Fabrice Fontaine wrote:
> It seems package has a parallel build issue on ARM cortex A8 or A9 since
> at least version 2.5:
> 
> [ 94%] Linking CXX shared library libx265.so
> ipfilter8.S.o: file not recognized: File truncated
> collect2: error: ld returned 1 exit status
> CMakeFiles/x265-shared.dir/build.make:221: recipe for target 'libx265.so.160' failed

Could you submit a bug report upstream for this issue ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
