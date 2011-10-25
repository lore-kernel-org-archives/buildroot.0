From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Oct 2011 09:13:21 +0200
Subject: [Buildroot] Some topics for the Buildroot Developer Day
In-Reply-To: <20111025082432.196d59aa@skate> (Thomas Petazzoni's message of
 "Tue, 25 Oct 2011 08:24:32 +0200")
References: <20111024173815.2277c6dd@skate>
 <CAAu5YTaZHudEQ+1vZoYA0v-RRVZ_tVm07ykR389vH9iaqMgNKw@mail.gmail.com>
 <20111025082432.196d59aa@skate>
Message-ID: <871uu1y25q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> But I still do remember that it was working just fine on autotargets
 Thomas> packages, but was causing problems on gentargets packages. And there
 Thomas> were also other problems here and there, and the whole thing was making
 Thomas> Buildroot a lot more complicated. I really think we need to keep a
 Thomas> "simplicity first" rule for Buildroot. There are already other very
 Thomas> elaborate build systems, with package management and al., and it
 Thomas> doesn't make sense if Buildroot becomes as complicated as those build
 Thomas> systems.

I strongly agree.

I'm wondering if we could somehow get rid of the explicit handling of
both staging and target (similar to how we do it for host packages), and
simply exclude some files from staging when we create the file systems.

-- 
Bye, Peter Korsgaard
