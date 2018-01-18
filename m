From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 09:14:32 +0100
Subject: [Buildroot] [PATCH 5/5] python-crossbar: bump to version
 17.6.1.post3
In-Reply-To: <CAGm1_ksN6N_bu8H4m14uMSpPJ=NB2NJQVbJxatudKJdXRfs4xg@mail.gmail.com>
References: <20180111092520.28438-1-yegorslists@googlemail.com>
 <20180111092520.28438-5-yegorslists@googlemail.com>
 <20180117234235.032486fc@windsurf>
 <CAGm1_ksN6N_bu8H4m14uMSpPJ=NB2NJQVbJxatudKJdXRfs4xg@mail.gmail.com>
Message-ID: <20180118091432.1942d701@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Jan 2018 09:03:35 +0100, Yegor Yefremov wrote:

> > Crossbar has a lot of dependencies, so perhaps it would be useful to
> > add a runtime test for it in support/testing/ ? I.e a test that builds
> > a configuration with Crossbar enabled, boots it and verifies that
> > Crossbar works in a minimal way.  
> 
> No problem, but do we have final solution for the tests? I've sent a
> patch [1], then Yann has sent some patches. What is the current state
> of this issue?
> 
> [1] http://patchwork.ozlabs.org/patch/811011/

I need to look at the pending stack of patches for tests, I'm running
late on this topic indeed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
