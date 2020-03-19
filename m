From: Gao Xiang <hsiangkao@aol.com>
Date: Thu, 19 Mar 2020 21:25:58 +0800
Subject: [Buildroot] [PATCH v2 1/2] package/erofs-utils: new package
In-Reply-To: <20200318223950.GC10025@scaer>
References: <20200316015838.15183-1-hsiangkao.ref@aol.com>
 <20200316015838.15183-1-hsiangkao@aol.com>
 <20200318223950.GC10025@scaer>
Message-ID: <20200319132546.GA5552@hsiangkao-HP-ZHAN-66-Pro-G1>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Wed, Mar 18, 2020 at 11:39:50PM +0100, Yann E. MORIN wrote:
> Gao, All,
> 
> On 2020-03-16 09:58 +0800, Gao Xiang spake thusly:
> > This patch adds EROFS userspace tool erofs-utils to buildroot,
> > which can be used to generate EROFS images.
> > 
> > Signed-off-by: Gao Xiang <hsiangkao@aol.com>
> 
> Applied to master, with the following fixes:
> 
>   - add explicit --enable-lz4
>   - explain why autoreconf
>   - add DEVELOPPER entry
> 
> Thanks!

Thanks for taking time & your help on this patch, it looks good
to me. :)

And if possible, could you also kindly consider [PATCH v2 2/2]?

I have been verified this series by booting up generated rootfs
images with no unexpected behavior, kindly let me know if
something else needed.

Thanks,
Gao Xiang
