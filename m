From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 13 Jun 2008 15:10:20 -0300
Subject: [Buildroot] Still no answer for a contribution -- "me too"
In-Reply-To: <4852A641.9060101@tirsdagsklubben.nu>
References: <20080611161156.33737116@crazy>
	<200806130824.42363.buildroot.atmel.com@pollet.net>
	<87a5b0800806130407wddd40a0v53712cddcb76b611@mail.gmail.com>
	<20080613120529.GB31396@cloud.net.au>
	<4852A641.9060101@tirsdagsklubben.nu>
Message-ID: <d6cda7730806131110y3a4244abm9df4fa91c757964a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I am in a similar situation to many of the other contributors to this list.
> I am working as consultant mostly for a local customer. As long as my bug
> reports and patches are related to
> the product development I am doing I can spend some paid time for the common
> good. My last project was porting of a customer specific firewall from a
> RedHat derivative to a buildroot based platform. My current project is an
> attempt to port firefox-3.0 to  DirectFB on a customer specific card. The
> processor on this card is  a mipsel based "system on a chip".

A bit off-topic, but did you consider Webkit? it's working in
buildroot, and it passes 97% ACID3 test, making it in that respect
better than firefox. And it should consume less resources (memory and
CPU cycles). The downside is lack of Flash, but I guess there is no
flash for linux based MIPs archs.

> For both these projects parts of what I do is of general interest and fixes
> should be done in buildroot, other parts are customer specific and will
> probably of little interest for most other companies.

Being able to have your fixes in mainstream is a win-win thing to do.
Takes out some of the maintenance burden of forking and you get other
people's fixes. For buildroot, it gets better in general, receiving
fixes, and most importantly, more eyeballs.

> Personally I would like to have subversion commit access to be able to speed
> up obvious bug-fixes, but I will at the same time try to avoid making a mess
> of the repository.

This is my third attempt, I was able to talk to Mike, and seams that
being vouched for is all that is required. Which would imply getting
some patches sent before.

> Obvious fixes, like missing dependencies or faulty configuration parameters
> can be fixed directly on trunk if they are well tested locally and unlikely
> to cause regressions in other builds. More tricky or larger fixes, like
> introducing new packages or upgrading major versions of several
> interdependent packages at the same time can be done in their own feature
> branches. Anybody with access to the repository can test and review these
> changes. If the fix(es) are accepted the feature branch is merged back into
> trunk and deleted. Creating merging and deleting branches are cheap
> operations in subversion.
>

Yes, that's one of the things that would be greatly beneficial to the
project, along with having releases and perhaps a continal building
system. I tried once to get builtbot to work with buildroot, even
asked for some help here but no one was interested in replying. :(

Kind Regards,
   Thiago A. Correa
