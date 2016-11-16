From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Nov 2016 12:33:31 +0100
Subject: [Buildroot] [PATCH 1/1] sdl: fix building on powerpc64 and
 powerpc64le
In-Reply-To: <f3f4937e-e29f-e504-371f-f393346f5ade@mind.be>
References: <a57a3d0430e248ee08148cef326cbf60283205ad.1478489382.git.sam.bobroff@au1.ibm.com>
 <20161107225106.5e9e61b6@free-electrons.com>
 <53f345eb-3ea1-02ef-06bf-72f011b3728a@mind.be>
 <20161108051006.GB6803@tungsten.ozlabs.ibm.com>
 <99a8adb3-3fa3-7050-e31f-16d2ee67ea12@mind.be>
 <20161109043021.GA10982@tungsten.ozlabs.ibm.com>
 <eijmfdxo6o.ln2@ID-313208.user.individual.net>
 <f3f4937e-e29f-e504-371f-f393346f5ade@mind.be>
Message-ID: <20161116123331.44f50097@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Nov 2016 21:18:46 +0100, Arnout Vandecappelle wrote:

>  Nice idea, but it's only possible for internal toolchains. Unless if we merge
> the ld-wrapper patches (last news of which was: it shouldn't be needed).
> 
>  I'm slightly inclined to go for patching configure or libtool.m4 instead.

Can we move forward with this topic? Could somone summarize the problem
and options we have with advantages/drawbacks?

We've got quite a lot of build failures because of that. In the latest
autobuild report, we've got 7 build failures on powerpc64le (on a total
of 41 build failures), and I suspect a significant number of them are
due to this libtool issue.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
