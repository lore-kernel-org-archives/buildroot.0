From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 21:15:14 +0200
Subject: [Buildroot] [PATCH] Clarify MIPS ABIs support
In-Reply-To: <20120725203109.5d295941@skate>
References: <1343162828-13060-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <50102DAA.1030400@mind.be> <20120725202503.7ecae923@skate>
 <20120725203109.5d295941@skate>
Message-ID: <20120725211514.1ee35d6a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 25 Jul 2012 20:31:09 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> Thinking more about this, the way we do things for i386 vs. x86_64 is
> not optimal: there are two complete distinct sets of entries for the
> processor types. One for i386, one for x86_64. However, there should
> normally be a big overlap between the two, since all x86_64 processors
> support the i386 architecture. So maybe we should have a single list,
> with certain processor not being visible in the i386. This would ensure
> consistency between the list of processors available on i386 and x86_64.

In other words, something like:
