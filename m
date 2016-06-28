From: Andrew Webster <Awebster@arcx.com>
Date: Tue, 28 Jun 2016 15:21:30 +0000
Subject: [Buildroot] [PATCH v6 3/3] docker-engine: new package
In-Reply-To: <1467068526449-c5b1aab4-841d852a-e8d99e85@mixmax.com>
References: <1464475578-22239-1-git-send-email-christian@paral.in>
 <1464475578-22239-4-git-send-email-christian@paral.in>
 <f27fd228ed034bc499fe1c69ac9a3980@WEBMAIL.arcx.com>
 <20160607215439.76ad85ee@free-electrons.com>
 <CA+h8R2oZypDvm65RVp3fNX1MYCxSWqX95MxLW-q-K25d4tNccg@mail.gmail.com>
 <59dc9de3a6b14bf5be1c61368dc0cbde@WEBMAIL.arcx.com>
 <20160607224744.5ed22c32@free-electrons.com>
 <6f608608c76e4ebd82e22c93ea6add8d@WEBMAIL.arcx.com>
 <1467068526449-c5b1aab4-841d852a-e8d99e85@mixmax.com>
Message-ID: <c99d8392e79c4a339cd1c4fdd1e21eca@WEBMAIL.arcx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: Christian Stewart [mailto:christian at paral.in] 
> Sent: Monday, June 27, 2016 7:02 PM

> On Tue, Jun 7, 2016 at 1:18 PM Andrew Webster <Awebster@arcx.com> wrote:
> >?Here is a patch with the init file I used.? I copied the contrib/init/sysvinit-debian/docker file and modified it slightly.

> Thank you again for this patch. It doesn't apply to my latest version of docker-engine, though. Could you have a look at my master branch at:
> http://github.com/paralin/buildroot
> And rebase?

Patch applied cleanly to your master branch.  I also have an additional patch to clean up the "restart".  It may be better if I send the patches using send-email, but I don't want to CC buildroot or they will end up in patchwork.
I can send directly to you instead.

> I've updated Docker to the latest v1.12-rc2 which has a lot of breaking changes, so it might require some additional work from your end (sorry!)

I haven't yet tried to build/run yet, and may not have a chance for a few days.  Would you rather wait until I try it out before I send you patches?

Andrew
