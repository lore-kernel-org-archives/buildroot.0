From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 Oct 2009 09:09:29 +0200
Subject: [Buildroot] [git commit master] buildroot;
	move defconfigs to configs/ and print in help
In-Reply-To: <20091005084845.023ff120@surf> (Thomas Petazzoni's message of
	"Mon\, 5 Oct 2009 08\:48\:45 +0200")
References: <20091004202133.B35E577762@busybox.osuosl.org>
	<20091005084845.023ff120@surf>
Message-ID: <873a5y5nbq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> As discussed earlier on the mailing list. It simplifies code, gives
 >> more sensible error message on typos and makes the defconfigs easier
 >> to find for users.

 Thomas> I have to say I'm not necessarly a big fan of this change. The
 Thomas> _defconfig files used to be stored together with the kernel
 Thomas> configuration, busybox configuration, uClibc configuration and target
 Thomas> skeleton specific to a target (in target/device/<vendor>/<board>).

 Thomas> Now, the _defconfig files are in a separate location, which makes it
 Thomas> slightly less logical/easy for people to add new targets.

True - This change makes it slightly harder for developers, but easier
for users to find (and for us to do a test build of all defconfigs prior
to release).

The stuff in target/device/ tends to get stale over time, so a bit more
visibility is imho good.

I obviously like it, and I never had any comments when I proposed it
back in September:

http://lists.busybox.net/pipermail/buildroot/2009-September/029269.html

-- 
Bye, Peter Korsgaard
