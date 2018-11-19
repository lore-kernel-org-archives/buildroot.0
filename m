From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Mon, 19 Nov 2018 08:14:35 +0000
Subject: [Buildroot] [arc-buildroot] [PATCH] toolchain: Bump ARC tools
 to arc-2018.09-rc1
In-Reply-To: <87sgzymag4.fsf@dell.be.48ers.dk>
References: <20181108113207.40589-1-Evgeniy.Didin@synopsys.com>
 <a4c4c371bc8fbefc5e3e1a466ed80dfd334a4b9a.camel@synopsys.com>
 <87sgzymag4.fsf@dell.be.48ers.dk>
Message-ID: <10340406050326f099c2688645f8dfca2b1f9b7f.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sun, 2018-11-18 at 20:50 +0100, Peter Korsgaard wrote:
> > > > > > "Alexey" == Alexey Brodkin <alexey.brodkin@synopsys.com> writes:
> 
>  > Hi Thomas, Peter, Arnout!
>  > On Thu, 2018-11-08 at 14:32 +0300, Evgeniy Didin wrote:
>  >> This commit bumps ARC toolchain to arc-2018.09-rc1.
>  >> We want to test how new toolchain-rc1 builds packages,
>  >> so we can make fixes before release of toolcain.
>  >> 
>  >> ARC GNU tools of version arc-2018.09-rc1 bring some quite significant changes like:
>  >> * Binutils v2.31.1 with additional ARC patches
>  >> * GCC 8.2.1 with additional ARC patches
>  >> * glibc 2.28 with additional ARC patches
>  >> 
>  >> Please note that it is a release candidate and it might contain some
>  >> breakages, please don't use it for production builds.
>  >> 
>  >> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
>  >> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  >> Cc: arc-buildroot at synopsys.com
> 
>  > Any chance arc-2018.09 tools to be accepted in v2018.11 BR release?
> 
> Sorry, I find it too late for that by now. I have instead applied it to
> next, hopefully that is OK?

Well, the hope was to get arc-2018.09 in BR v2018.11 release as
we're going to cut the final release in coming days but...

maybe it's good that we'll have a longer stabilization cycle
for our tools in BR especially keeping in mind that we're
switching from GCC 7.x to 8.x and there might come up some
issues related more to GCC 8.x than to ARC port itself.

>  > In the meantime we've got RC2 cut just yesterday with a couple of more
>  > critical fixes so it might make sense to bump right to arc-2018.09-rc2
>  > instead but still it might be applied on top of this one so pls let us
>  > know what would you prefer.
> 
> Please send a patch for next to bump it to RC2.

We'll do that, sure.

-Alexey
