From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 14 Feb 2017 12:42:04 +0100
Subject: [Buildroot] [PATCH] kmsxx: not available on m68k
In-Reply-To: <87fujhkrik.fsf@dell.be.48ers.dk>
References: <20170213093502.26507-1-peter@korsgaard.com>
 <20170213132925.5324f141@free-electrons.com>
 <8760kema97.fsf@dell.be.48ers.dk>
 <20170213213713.GA12810@waldemar-brodkorb.de>
 <87fujhkrik.fsf@dell.be.48ers.dk>
Message-ID: <20170214114204.GD12810@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,
Peter Korsgaard wrote,

> >>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:
> 
> Hi,
> 
>  >> That's also fine by me if somebody wants to do that. I personally don't
>  >> know/care enough about m68k, and it has been failing since October
>  >> without anything happening, so I think we should disable it.
> 
>  > It is not that nothing happened.
>  > I think this would be solved by my following patch:
>  > http://buildroot-busybox.2317881.n4.nabble.com/PATCH-m68k-add-special-gcc-flag-to-avoid-ICE-for-coldfire-td151151.html
> 
> Sorry, I forgot about the relation between this build issue and the
> "magic" compiler flag.
> 
>  > Did you had a chance to discuss the required changes with Arnout in
>  > the last developer meeting?
> 
> I could only join from Monday evening, but I don't think so.
> 
> We are again past rc1, so I think the safest approach for 2017.02 is to
> not add it to the wrapper, but instead explicitly pass it in kmsxx.mk
> (and any other package with the same problem). From my IRC history this
> also seems to be what you discussed with Thomas yesterday.
> 
> Will you send patches to do this?

I can try. But now I am back to my original problem, how do I
overwrite CFLAGS/CXXFLAGS correctly for a single package build with
cmake?

Any examples in the tree?

I think that was the reason we tried to add it globally in the
wrapper :/

best regards
 Waldemar
