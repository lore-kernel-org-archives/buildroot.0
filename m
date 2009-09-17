From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 17 Sep 2009 14:02:12 +0200
Subject: [Buildroot] [PATCH 2/6] Remove the BOARD/LOCAL feature
In-Reply-To: <20090917074342.7ea13dd0@surf> (Thomas Petazzoni's message of
	"Thu\, 17 Sep 2009 07\:43\:42 +0200")
References: <1253135266-26880-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1253135266-26880-3-git-send-email-thomas.petazzoni@free-electrons.com>
	<d6cda7730909161500xbb81de5j195ce89fd2fd5db2@mail.gmail.com>
	<20090917000846.2eb5baca@surf>
	<d6cda7730909161521k54dbdcfaud53cca89589dffe6@mail.gmail.com>
	<20090917074342.7ea13dd0@surf>
Message-ID: <87zl8tye2j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Well, it's already done by the patch (and works). Since a
 Thomas> symbolic link to the BUILDROOT_EXTERNAL_BOARDS directory is
 Thomas> added in target/device/, I just added the -L option to find and
 Thomas> it is able to find the defconfig of the external boards. See
 Thomas> the patch for the one-liner implementation :-)

Doesn't that give problems with the symlinks to /tmp and similar in the
target_skeleton's? Especially if you build in /tmp.

-- 
Bye, Peter Korsgaard
