From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 22:31:32 +0100
Subject: [Buildroot] [PATCH v2] autobuild-run: do not build python
 statically with non-working toolchain
In-Reply-To: <1421335280-55579-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1421335280-55579-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150201223132.29ee04fe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 15 Jan 2015 15:21:20 +0000, Vicente Olivert Riera wrote:
> Python package can't be built using this uClibc toolchain due to a
> problem with redefinitions:
> 
> setregid.c:(.text+0x0): multiple definition of
> `setregid'setregid.c:(.text+0x0): multiple definition of `setregid'
> 
> Reported upstream:
>   http://lists.busybox.net/pipermail/uclibc/2014-October/048699.html
> 
> Fixes:
>   http://autobuild.buildroot.net/results/74d/74deae1f7c81e319d1e7d00177f7c8e2c97b8ce8/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
