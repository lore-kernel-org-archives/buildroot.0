From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 17 Apr 2020 17:36:14 +0200
Subject: [Buildroot] [PATCH] package/nfs-utils: fix build failure with
 musl libc
In-Reply-To: <20200417153314.37637-1-giulio.benetti@benettiengineering.com>
References: <20200417153314.37637-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200417153614.GA1037840@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Giulio,

> Musl libc defines time_t as 64-bit causing printf() to fail since it
> tries to pass time_t as a 32-bit("%ld"). So let's add upstream patch[1]
> to fix this issue.

> [1]:
> http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=cb75ec49c0a92f55b2241eb1cd95a3fdf63f0dac

> Fixes:
> http://autobuild.buildroot.net/results/35ce3dbd63a658953008ce7e7b99e0580d3f2c4b

Thanks for adding this fix.
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
