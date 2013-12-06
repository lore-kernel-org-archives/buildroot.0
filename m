From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 06 Dec 2013 22:50:08 +0100
Subject: [Buildroot] [PULL REQUEST 00/16] ARC and Microblaze toolchain
	updates
In-Reply-To: <1386264059-14057-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 5 Dec 2013 18:20:43 +0100")
References: <1386264059-14057-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y53xbqen.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello Peter,
 > Can you please pull the following patches? They have been around for a
 > while, and I've tested them successfully: the Microblaze LE,
 > Microblaze BE and ARC toolchains. It fixes a big number of build
 > issues on Microblaze especially, like OpenSSL, or Nettle.

 > According to Thomas DS comment, I've split Mischa's patch adding the
 > github helper into three patches: one adding the helper, one adding
 > the documentation, one converting a bunch of packages to the new
 > helper. Note that not all packages are converted, but this can be done
 > through followup commits: we really want this ARC and Microblaze stuff
 > to get merged now.

 > Thanks a lot!

Committed series, thanks all!

-- 
Bye, Peter Korsgaard
