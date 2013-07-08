From: Woody Wu <narkewoody@gmail.com>
Date: Mon, 8 Jul 2013 13:47:27 +0800
Subject: [Buildroot] savedefconfig for busybox?
In-Reply-To: <87d2qui2au.fsf@dell.be.48ers.dk>
References: <20130707132034.GA10748@zuhnb712> <87d2qui2au.fsf@dell.be.48ers.dk>
Message-ID: <20130708054726.GA3311@zuhnb712.ap.bm.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 07, 2013 at 09:43:21PM +0200, Peter Korsgaard wrote:
> >>>>> "Woody" == Woody Wu <narkewoody@gmail.com> writes:
> 
>  Woody> Hi,
>  Woody> Is there something like 'make busybox-savedefconfig'?
>  Woody> Or, otherwise, how to save busybox config changes?
> 
> Do you mean a minimal .config (a defconfig) file? Upstream busybox
> unfortunately doesn't support that.
> 
> If you just mean how to save your full busybox .config after you changed
> it with 'make busybox-menuconfig', then you can just copy
> out/build/busybox-*/.config to somewhere
> (board/vendor/product/busybox.config is a common location) and
> then change your buildroot BR2_PACKAGE_BUSYBOX_CONFIG option to point to
> it.
> 
> Also see section 3.3.2 and 3.3.3 in the user manual:
> 
> http://buildroot.net/downloads/manual/manual.html#busybox-custom
> 

understood, thanks Peter.

> -- 
> Bye, Peter Korsgaard

-- 
I can't go back to yesterday - because I was a different person then
