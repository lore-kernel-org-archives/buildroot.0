From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 22:35:41 +0100
Subject: [Buildroot] [PATCH 1/1] mpv: fix build on powerpc64 w/ altivec
In-Reply-To: <2caa778dd77d8e8b473a9d2507368bb2c4b497b9.1478484002.git.sam.bobroff@au1.ibm.com>
References: <2caa778dd77d8e8b473a9d2507368bb2c4b497b9.1478484002.git.sam.bobroff@au1.ibm.com>
Message-ID: <20161107223541.15234e0b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  7 Nov 2016 13:00:03 +1100, Sam Bobroff wrote:
> Fixes
> http://autobuild.buildroot.net/results/77f/77f00633b0b25f001cd4ca54ed3a12aee301c287
> 
> Add a patch to work around a name collision between bool and altivec's
> bool.
> 
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>

Could you instead try to #include <stdbool.h> in this ao_sdl.c file?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
