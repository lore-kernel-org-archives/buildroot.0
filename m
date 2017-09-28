From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 28 Sep 2017 18:47:31 +0000
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2017.09-rc1
In-Reply-To: <20170921182828.26985-1-didin@synopsys.com>
References: <20170921182828.26985-1-didin@synopsys.com>
Message-ID: <1506624449.3713.17.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Arnout,

On Thu, 2017-09-21 at 21:28 +0300, Evgeniy Didin wrote:
> This commit bumps ARC toolchain to arc-2017.09-rc1.
> 
> Now speaking about arc-2017.09 series it is built on top
> of upstream GCC 7.1.1 and Binutils 2.29 so please expect
> all kinds of breakages related to GCC 7.x as we saw earlier
> with move from 4.8 to 6.x :)
> 
> Note patches for both GCC and Binutils were updated with
> copies from corresponding mainline versions, i.e.
> "package/gcc/7.2.0" and "package/binutils/2.29".
> 
> Please note that it is a release candidate and it might contain
> some breakages, please don't use it for production builds.
> 
> !!This super commit rewrites older commit which bumped
> !!arc toolchain to 2017.09-eng008 vesrion

Is there a chance to get this one applied sometime soon?
It would be good to have it run through autobuilder before
we cut a final release. That way we'll be able to catch
problems on RC stage.

-Alexey
