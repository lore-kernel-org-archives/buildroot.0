From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 May 2009 14:22:39 +0200
Subject: [Buildroot] 2009.05-rc3 released
In-Reply-To: <56ea0bb80905272131h4aac2dceh86b7b8636031dc7d@mail.gmail.com>
	(Paul Archer's message of "Thu\, 28 May 2009 14\:31\:56 +1000")
References: <87k5428ixt.fsf@macbook.be.48ers.dk>
	<56ea0bb80905272131h4aac2dceh86b7b8636031dc7d@mail.gmail.com>
Message-ID: <87ws8176y8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Archer <ptarcher@gmail.com> writes:

 Paul> On Thu, May 28, 2009 at 5:06 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
 >> And report any issues found here or in the bugtracker.
 Paul> I have been trying to build buildroot with a ubifs image. I haven't
 Paul> quite got there yet, but there are some bugs associated with this
 Paul> version.

 Paul> target/ubifs/ubifsroot.mk
 Paul> $(call DOWNLOAD,"$(MKFS_UBIFS_URL)")

 Paul> This should be a WGET, not a DOWNLOAD.

Thanks - Will fix. I just gave it a test, and it seems like the
upstream git tree is gone, so it won't help you much.

Hamish, I believe you were the one adding ubifs support - What is the
situation with mkfs.ubifs? Is upstream mtd-utils nowadays like
mkfs.jff2?

Seems like we'll have to make ubifsroot as broken for the 2009.05
release :/

-- 
Bye, Peter Korsgaard
