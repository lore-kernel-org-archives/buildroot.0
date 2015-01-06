From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jan 2015 09:34:06 +0100
Subject: [Buildroot] [PATCH 00/29] SELinux Buildroot Additions
In-Reply-To: <CANQCQpZPzH-BaxM3tjDrypLzGG23goxZzz-TS=uU4gW3uuRpfg@mail.gmail.com>
References: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20150101224717.2a063a90@free-electrons.com>
 <CANQCQpYzQyMBd8eKvJ8NtB59JpUvSfost6J+5k1gvKKqxNU+eQ@mail.gmail.com>
 <CANQCQpaUT_e3UY9-fcghHOMeVDB=X1TJ8iNi1BqV21oUn+VPeA@mail.gmail.com>
 <CANQCQpZPzH-BaxM3tjDrypLzGG23goxZzz-TS=uU4gW3uuRpfg@mail.gmail.com>
Message-ID: <20150106093406.4e249077@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Weber,

On Mon, 5 Jan 2015 21:37:29 -0600, Matthew Weber wrote:

> > It looks like they have set things up to support backwards
> > compatibility with separate releases for the different packages,
> > however I'd rather refactor the patchset to use the new approach.
> 
> I just noticed that the release script they use is intentionally
> packaging each folder/package separately, so it does look like that's
> their current approach (even in a single repo).  I think we still
> should consolidate it into a single package.  For every disadvantage I
> can think of for having it as one package, I can see resolving those
> through a temporary patch or the way the Kconfig exposes what's built.

I disagree: they are still shipping the thing as separate tarballs for
each component, so we should continue to have separate packages in
Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
