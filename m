From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 16 Mar 2016 10:23:32 +0200
Subject: [Buildroot] [PATCH] quagga: security bump to version
	1.0.20160309
In-Reply-To: <87mvpy6dg0.fsf@dell.be.48ers.dk>
References: <46743f76247ed0f41bf1b3a77bbd967736b6765e.1458058320.git.baruch@tkos.co.il>
 <87mvpy6dg0.fsf@dell.be.48ers.dk>
Message-ID: <20160316082332.GR5528@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, Mar 16, 2016 at 09:21:03AM +0100, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > Fixes CVE-2016-2342 (AKA VU#270232): Quagga bgpd with BGP peers enabled for
>  > VPNv4 contains a buffer overflow vulnerability.
> 
>  > Remove the --enable-babeld and --enable-opaque-lsa configure options that were
>  > removed in this release.
> 
>  > See the release announcement at
>  > https://lists.quagga.net/pipermail/quagga-dev/2016-March/014938.html.
> 
> This unfortunately causes some new build errors:
> 
> http://autobuild.buildroot.net/?reason=quagga-1.0.20160309
> 
> make[3]: *** No rule to make target `../ospfd/libospf.la', needed by `libospfapiclient.la'.  Stop.
> 
> Perhaps a parallel build issue? Care to take a look?

I noticed that. I'll look into it later today.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
