From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Jul 2020 17:53:56 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-07-12
In-Reply-To: <CANQCQpbch4btr_v9wAYPBiHC62Q1cGKN0Kc6_9c9jTWz1Qa44Q@mail.gmail.com>
References: <5f0c105a.1c69fb81.17d79.8de3SMTPIN_ADDED_MISSING@mx.google.com>
 <CAJe0E3fag3pVOjp+4ZHTq8mpVB7Ni18k0jrM_Bz_huxKa3QP3w@mail.gmail.com>
 <20200717173748.2485d781@windsurf.home>
 <CANQCQpbx8cHi4reD2ScvubHQCfa_fGzz020KzRNmObhBA8iyWg@mail.gmail.com>
 <20200721172355.16a5a651@windsurf.home>
 <CANQCQpbch4btr_v9wAYPBiHC62Q1cGKN0Kc6_9c9jTWz1Qa44Q@mail.gmail.com>
Message-ID: <20200721175356.6980b430@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Jul 2020 10:30:34 -0500
Matthew Weber <matthew.weber@collins.com> wrote:

> Ah, yeah that could work.  I was looking at making a subsection under
> "21.6. Reporting issues/bugs or getting help" if we do add it in the
> manual.  There are going to be cases where a Buildroot CVE report
> misreports because of our scripts, plus the case of an actual
> dictionary bug.

I think section 21.6 is really more oriented towards end users of
Buildroot, and explain how they should get back to us to report
issues/bugs.

The topic of how to notify NVD maintainers of invalid CVEs is really
advanced, and mainly a Buildroot maintainer/developer topic.

> Maybe we start on the wiki?

Yes, I would say yes. Perhaps start a page related to security/CVE
tracking in Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
