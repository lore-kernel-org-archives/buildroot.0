From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 16 Nov 2012 00:00:50 +0100
Subject: [Buildroot] [PATCH 01/23] dependencies.sh: remove makeinfo
	(texinfo) from the requirement list
In-Reply-To: <20121111181034.33a1c150@skate> (Thomas Petazzoni's message of
 "Sun, 11 Nov 2012 18:10:34 +0100")
References: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
 <1352639701-27829-2-git-send-email-s.martin49@gmail.com>
 <20121111181034.33a1c150@skate>
Message-ID: <87lie21nfh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Samuel Martin,
 Thomas> On Sun, 11 Nov 2012 14:14:39 +0100, Samuel Martin wrote:
 >> 
 >> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 Thomas> Why do you think they are no longer necessary? IIRC, they are
 Thomas> needed for the build of binutils/gcc during the internal
 Thomas> backend toolchain build. But I admittedly haven't tested
 Thomas> building with these recently.

Ok, I'll drop this patch for now as discussed on IRC.

-- 
Bye, Peter Korsgaard
