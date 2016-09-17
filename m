From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 14:28:23 +0200
Subject: [Buildroot] [PATCH] openal: Disable build also for examples and
 tests
In-Reply-To: <1473956868-9619-1-git-send-email-nerv@dawncrow.de>
References: <1473956868-9619-1-git-send-email-nerv@dawncrow.de>
Message-ID: <20160917142823.58760696@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Sep 2016 18:27:48 +0200, Andr? Hentschel wrote:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  package/openal/openal.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master after adding the reference to the autobuilder failure.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
