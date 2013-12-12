From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 12 Dec 2013 23:20:28 +0100
Subject: [Buildroot] [PATCH v4] uboot: support -r option for mkenvimage
In-Reply-To: <1386611473-8368-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Mon, 9 Dec 2013 17:51:13 +0000")
References: <1386611473-8368-1-git-send-email-spdawson@gmail.com>
Message-ID: <87k3f91zkj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > Some boards are configured in u-boot to store multiple redundant copies of
 > the environment image in flash. For these boards, it is required to
 > pass the -r flag, when generating a boot environment image using
 > mkenvimage.

 > Signed-off-by: Simon Dawson <spdawson@gmail.com>
 > ---
 >  v4: Rebase on current master
 >  v3: Further improvement of help text, as suggested by Thomas Petazzoni
 >  v2: Change configuration menu text and help text, in response to feedback
 >      from Arnout Vandecappelle and Thomas Petazzoni

Committed, thanks.

-- 
Bye, Peter Korsgaard
