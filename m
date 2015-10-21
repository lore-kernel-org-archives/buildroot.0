From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 23:20:20 +0200
Subject: [Buildroot] [PATCH 2/2] jq: enable host package
In-Reply-To: <5627FDD5.8060207@mind.be>
References: <1445251329-18120-1-git-send-email-patrickdepinguin@gmail.com>
 <1445251329-18120-2-git-send-email-patrickdepinguin@gmail.com>
 <20151021223958.5605a589@free-electrons.com>
 <5627FDD5.8060207@mind.be>
Message-ID: <20151021232020.610e4735@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Wed, 21 Oct 2015 23:04:21 +0200, Arnout Vandecappelle wrote:

>  I was thinking the same thing when I say the patch, but I don't care enough to
> really comment on it. It's a bit similar to packages that depend on some host
> preprocessing tool, like flex. But then of course we just have a dependency and
> not a Config.in.host.

To me, host packages that are a dependency of some other target
packages have a real and strong reason to exist. The ones that don't
should really fall into the "useful for debugging, flashing or
preparing images" category IMO.

>  OTOH, if we accept this, it kind of opens the doors to support almost
> everything as a host package. But maybe there's nothing wrong with that either.

Opening the door to almost everything as a host package is personally
something that I'd like to avoid.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
