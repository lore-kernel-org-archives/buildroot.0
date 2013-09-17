From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 Sep 2013 17:29:27 +0200
Subject: [Buildroot] Is GPLv2 the right license for Buildroot?
In-Reply-To: <l19qcl$f47$1@ger.gmane.org> (Grant Edwards's message of "Tue, 17
 Sep 2013 14:53:09 +0000 (UTC)")
References: <20130911091700.0b24df41@skate>
 <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
 <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate> <52323A54.7020808@mind.be>
 <20130912221256.GE3362@free.fr> <523388B6.7090305@mind.be>
 <20130914221613.GA3444@free.fr> <20130916182101.3844a686@skate>
 <87vc20fp2g.fsf@dell.be.48ers.dk> <20130917064405.6300d72b@skate>
 <l19qcl$f47$1@ger.gmane.org>
Message-ID: <87r4cneaaw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

 Grant> On 2013-09-17, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
 >> Yes, but I do believe that no company is actually complying to the
 >> GPL requirements by providing the build system source code.

 Grant> We do.  I wrote a shell-script that removes proprietary files/packages
 Grant> and bundles the resulting buildroot source tree which can then be used
 Grant> to build all of the open-source stuff.

 Grant> Nobody's ever _requested_ the sources, but they're available.  

 Grant> I don't expect that anyone ever will request sources, since without
 Grant> the proprietary software, the hardware is pretty much useless.  I
 Grant> doubt any of our customers would be capable of building it even if
 Grant> they did have the source tree in hand.

Indeed. I've also archived U-Boot / Linux / Buildroot and ensured the
user manual contains the GPL source code offer for our products, but so
far nobody has ever requested it.

-- 
Bye, Peter Korsgaard
