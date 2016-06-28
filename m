From: Christian Stewart <christian@paral.in>
Date: Tue, 28 Jun 2016 17:20:15 +0000
Subject: [Buildroot] [PATCH v6 3/3] docker-engine: new package
In-Reply-To: <c99d8392e79c4a339cd1c4fdd1e21eca@WEBMAIL.arcx.com>
References: <1464475578-22239-1-git-send-email-christian@paral.in>
 <1464475578-22239-4-git-send-email-christian@paral.in>
 <f27fd228ed034bc499fe1c69ac9a3980@WEBMAIL.arcx.com>
 <20160607215439.76ad85ee@free-electrons.com>
 <CA+h8R2oZypDvm65RVp3fNX1MYCxSWqX95MxLW-q-K25d4tNccg@mail.gmail.com>
 <59dc9de3a6b14bf5be1c61368dc0cbde@WEBMAIL.arcx.com>
 <20160607224744.5ed22c32@free-electrons.com>
 <6f608608c76e4ebd82e22c93ea6add8d@WEBMAIL.arcx.com>
 <1467068526449-c5b1aab4-841d852a-e8d99e85@mixmax.com>
 <c99d8392e79c4a339cd1c4fdd1e21eca@WEBMAIL.arcx.com>
Message-ID: <1467134415442-40b6aea4-c24e1afe-e35154b2@mixmax.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Andrew,
On Tue, Jun 28, 2016 8:21 AM, Andrew Webster Awebster at arcx.com wrote:

Patch applied cleanly to your master branch. I also have an additional patch to
clean up the ?restart?. It may be better if I send the patches using send-email,
but I don't want to CC buildroot or they will end up in patchwork.


I can send directly to you instead.

Sounds good to me. Awaiting your patch.


> I've updated Docker to the latest v1.12-rc2 which has a lot of breaking
changes, so it might require some additional work from your end (sorry!)






I haven't yet tried to build/run yet, and may not have a chance for a few days.
Would you rather wait until I try it out before I send you patches?




1.12 is working great now on my end. I think the only change you will need is to
add a ?d? to docker because they've renamed the daemon from ?docker daemon? to
just ?dockerd? by splitting it into a separate executable.
Also, they've added a lot of journald integrations and such, might be
interesting to see if we can get those working.
best, Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160628/d5548558/attachment.html>
