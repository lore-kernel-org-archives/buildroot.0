From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 22:52:01 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/busybox: enable ttyUSB[0-9]
 when using mdev
In-Reply-To: <1467399450-1005-1-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1467399450-1005-1-git-send-email-andriy.shevchenko@linux.intel.com>
Message-ID: <20160701225201.18cc6c82@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Jul 2016 21:57:30 +0300, Andy Shevchenko wrote:
> Some of our systems are using ttyUSB0 devices as a serial console.
> Add them to mdev.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  package/busybox/mdev.conf | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
