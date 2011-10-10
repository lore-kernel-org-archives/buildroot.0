From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Oct 2011 08:55:54 +0200
Subject: [Buildroot] [PATCH 1/9] external toolchain: slightly optimize
	the copy of the toolchain sysroot
In-Reply-To: <20111010084334.2d3d0544@skate> (Thomas Petazzoni's message of
 "Mon, 10 Oct 2011 08:43:34 +0200")
References: <cover.1318182187.git.thomas.petazzoni@free-electrons.com>
 <cover.1318182187.git.thomas.petazzoni@free-electrons.com>
 <98f060c40fdcc7c9d5464838a21d2ee7bc44971a.1318182187.git.thomas.petazzoni@free-electrons.com>
 <87ehylesfb.fsf@macbook.be.48ers.dk> <20111010084334.2d3d0544@skate>
Message-ID: <8762jxe3np.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Mon, 10 Oct 2011 00:00:56 +0200,
 Thomas> Peter Korsgaard <jacmet@uclibc.org> a ?crit :

 >> FYI, this breaks on readonly source directories unless you have the new
 >> rsync 3.0.9, which most people don't. I haven't figured out a good fix
 >> for older rsync versions yet.

 Thomas> Do you have some details ?

Sorry, I looked wrong - I read it as if it had never worked, but it was
actually a bug in 3.0.8.

-- 
Bye, Peter Korsgaard
