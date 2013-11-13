From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Nov 2013 10:45:40 +0100
Subject: [Buildroot] [git commit] legal info: fix saving of host package
 licenses
In-Reply-To: <CAAXf6LW+_yxwbhZ1M9JdzL+L=wh5koGm7uCk6Q4FkMDkmaArRA@mail.gmail.com>
References: <20131112222456.9EC029BB31@busybox.osuosl.org>
 <CAAXf6LUxdhxXxJXFbn6d7pV6TrxtoiW6-dwAv_JBPxcEdoqoHQ@mail.gmail.com>
 <20131113084543.2f21dc42@skate>
 <CAAXf6LW+_yxwbhZ1M9JdzL+L=wh5koGm7uCk6Q4FkMDkmaArRA@mail.gmail.com>
Message-ID: <20131113104540.1ad534e9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 13 Nov 2013 10:16:49 +0100, Thomas De Schampheleire wrote:

> > We were already November, 13th, that is 13th days late than the normal
> > -rc1 date, so I definitely support Peter in not having merged all the
> > possible pending features in 2013.11.
> >
> > That's all what time-based releases are for: stopping merging new
> > features at some point, knowing that they will anyway be merged in
> > -next pretty soon and be part of the following release 3 months later.
> 
> While I understand and agree with this principle for new patches, I
> think that patches that have just been waiting to be merged are a
> little different, unless there is an expected risk. Version bumps
> clearly add risk, but in my opinion the proposed patches do not.

Well the proposed patches touch the core package infrastructure, which
to me adds more risk than a version bump that may break an isolated
package. I guess it's a matter of perception :)

> Anyway, it's not that big of a deal. Let's focus now on stabilization
> and autobuild fixes.

Agreed :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
