From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 22:13:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/libaio: Power64 support AIO
In-Reply-To: <a59aa9d1-5e8c-c6e1-e5ed-cc1ad1c4a6e8@au1.ibm.com>
References: <a59aa9d1-5e8c-c6e1-e5ed-cc1ad1c4a6e8@au1.ibm.com>
Message-ID: <20170309221324.065df8a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 9 Mar 2017 11:56:47 +1100, Daniel Black wrote:
> Power64{,le} architecture supports AIO.
> 
> Signed-off-by: Daniel Black <daniel.black@au.ibm.com>
> Acked-by: Cyril Bur <cyrilbur@gmail.com>
> ---
>  package/libaio/Config.in | 1 +
>  1 file changed, 1 insertion(+)

For some reason, your patch didn't apply properly, most likely because
you sent it with Thunderbird. Next time, could you send your patches
using "git send-email"?

I've applied after fixing the patch, and tweaking a bit the commit log.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
