From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Mar 2008 22:47:39 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/package:editors	editors/vi
In-Reply-To: <20080307235344.GA6144@cloud.net.au> (Hamish Moffatt's message of
	"Sat\, 8 Mar 2008 10\:53\:44 +1100")
References: <ADB1372A-7CAA-41A5-A619-09A9DF0A0D0D@valka.is>
	<008b01c88027$780e44a0$040514ac@atmel.com>
	<4D6547F3-9672-4606-90EA-88630B3565E9@valka.is>
	<20080307235344.GA6144@cloud.net.au>
Message-ID: <87zlt7bmdg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

Hi,

 Hamish> Like Ulf says, it's convenient to be able to grep
 Hamish> package/*/*.mk and now that's broken. I think dividing of the
 Hamish> package/ directory needs discussion first.

grep -r is your friend.

I must say I kinda like the splitup of the package dir. The flat tree
goes back to when we didn't have many packages and no submenus under
packages. More consistency between menuconfig and the directory
structure is good thing.

 Hamish> It's not really a crowded directory by modern standards. Our file
 Hamish> systems can cope with much larger directories than that.

The limiting factor is us humans, not the file systems.

-- 
Bye, Peter Korsgaard
