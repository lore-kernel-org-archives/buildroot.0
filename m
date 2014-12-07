From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 22:10:31 +0100
Subject: [Buildroot] [PATCH] exiv2: add patch to fix build error with
 some toolchains
In-Reply-To: <1417688294-3397-1-git-send-email-nicolas.serafini@sensefly.com>
References: <1417688294-3397-1-git-send-email-nicolas.serafini@sensefly.com>
Message-ID: <20141207221031.604f565b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nicolas Serafini,

On Thu, 4 Dec 2014 11:18:14 +0100, Nicolas Serafini wrote:
> This patch remove a header inclusion that is not required an can create
> build error with some toolchains.
> The patch is pushed on the upstream for the next release.
> http://dev.exiv2.org/issues/1007
> 
> Fixes:
> http://autobuild.buildroot.net/results/09d/09d9b525eeee458247e10a7948070c00bbabb964/
> 
> Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
