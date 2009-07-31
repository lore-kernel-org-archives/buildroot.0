From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 31 Jul 2009 15:37:45 +0200
Subject: [Buildroot] [PATCH 1/3] Fix PROGRAM_INVOCATION handling with
	external toolchains
In-Reply-To: <20090731153256.28e22167@surf> (Thomas Petazzoni's message of
	"Fri\, 31 Jul 2009 15\:32\:56 +0200")
References: <cover.1249045362.git.thomas.petazzoni@free-electrons.com>
	<cover.1249045362.git.thomas.petazzoni@free-electrons.com>
	<8d880c3e5c68bea752c2a075d0ef0c64805df93f.1249045362.git.thomas.petazzoni@free-electrons.com>
	<87ab2lugi1.fsf@macbook.be.48ers.dk> <20090731153256.28e22167@surf>
Message-ID: <87ws5pt1li.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Fri, 31 Jul 2009 15:30:30 +0200,
 Thomas> Peter Korsgaard <jacmet@uclibc.org> a ?crit :

 >> Thanks. We should probably also update the defconfigs that sets this -
 >> I'll do that.

 Thomas> Yes, I've seen them with 'git grep', but I don't know what's the
 Thomas> procedure to update them. Just a quick sed pass ?

Yes, that's what I just did.

-- 
Bye, Peter Korsgaard
