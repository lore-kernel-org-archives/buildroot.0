From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 22:59:08 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/libdvbcsa: fix altivec
 problems on powerpc64
In-Reply-To: <519f9bc4a4a939e271938a2f974ce4b464187a1f.1480373845.git.sam.bobroff@au1.ibm.com>
References: <519f9bc4a4a939e271938a2f974ce4b464187a1f.1480373845.git.sam.bobroff@au1.ibm.com>
Message-ID: <20161130225908.2af90ab6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Nov 2016 09:57:29 +1100, Sam Bobroff wrote:
> Fixes:
> http://autobuild.buildroot.net/results/e6d22f5e0258c7ebb8a3ed39c11e014c721cd219
> 
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ---
> Notes:

Applied to next, thanks. I now it's a build fix, but we're about to
release the master branch as 2016.11, so it's too late for this one.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
