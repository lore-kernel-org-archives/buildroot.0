From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jun 2016 22:36:44 +0200
Subject: [Buildroot] [PATCH] uclibc: use shell script testsuite runner
In-Reply-To: <20160604204932.GA22985@waldemar-brodkorb.de>
References: <20160604204932.GA22985@waldemar-brodkorb.de>
Message-ID: <20160606223644.340d0901@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 4 Jun 2016 22:49:32 +0200, Waldemar Brodkorb wrote:
> There is no need for GNU make to run the testsuite.
> The benefit is you can even try it on noMMU targets as
> the script runs with busybox hush.
> Parallel build of the testsuite seems to work well.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/uclibc/Config.in | 4 +---
>  package/uclibc/uclibc.mk | 7 +++----
>  2 files changed, 4 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
