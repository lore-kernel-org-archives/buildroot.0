From: Daniele Palmas <Daniele.Palmas@telit.com>
Date: Mon, 30 Mar 2009 10:18:16 +0200
Subject: [Buildroot] Cannot find libbfd library in compiled toolchain
In-Reply-To: <87skkvbgi6.fsf@macbook.be.48ers.dk>
Message-ID: <B3B0FE219DFDB64F8905B1567ECB01BC8B40C8@urano.tmt.telital.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks again for your help.

Yeah, I know that now there is an oprofile package: I think that backporting it could be a solution.

Regards,
Daniele

-----Original Message-----
From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter Korsgaard
Sent: luned? 30 marzo 2009 9.46
To: Daniele Palmas
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] Cannot find libbfd library in compiled toolchain

>>>>> "Daniele" == Daniele Palmas <Daniele.Palmas@telit.com> writes:

Hi,

I'ce CC'ed the buildroot list again. Please keep buildroot
communication on the list.

 Daniele> Thanks for your answer.

 Daniele> Unfortunately I really mean 20080312: we have a product
 Daniele> based on this version of buildroot (and on the resulting
 Daniele> toolchain) and, for several reason, we cannot change this.

Ohh, that makes it harder to support you, but I'll try anyway.

 Daniele> I need libbfd because I want to build oprofile: it is one of
 Daniele> the requirements that should be fulfilled for
 Daniele> cross-compiling it. I've chosen oprofile because I've read
 Daniele> that gprof (one of the most common profiling tool for Linux)
 Daniele> doesn't work with uclibc.

I've never used either oprofile or gprof on uclibc, so I wouldn't
know.

You are aware that we have an oprofile package in buildroot these
days? It got added almost a year ago:

Author: Ninevoltz <ninevoltz@uclibc.org>
Date:   Thu Apr 24 16:54:29 2008 +0000

    add oprofile

    git-svn-id: svn+ssh://uclibc.org/svn/trunk/buildroot at 21847

You could try backporting that to your version.

-- 
Bye, Peter Korsgaard
