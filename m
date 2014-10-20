From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 20 Oct 2014 11:10:59 +0200
Subject: [Buildroot] [PATCH 01/31] ffmpeg: remove dangling reference to
	BR2_arm10
In-Reply-To: <1413749285-1108-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 19 Oct 2014 22:07:35 +0200")
References: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1413749285-1108-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vbnfayxo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > BR2_arm10 has been removed in commit
 > d60489a6e5e733a20d18b128646088981da57867 ("arch: remove BR2_arm10t"),
 > so there is no point in keeping a reference to it in the ffmpeg
 > package.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
