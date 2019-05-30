From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 May 2019 12:33:58 +0200
Subject: [Buildroot] [PATCH v2 1/6] package/lmbench: use
 UPDATE_CONFIG_HOOK instead of CONFIG_UPDATE
In-Reply-To: <20190528203416.32261-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 28 May 2019 22:34:11 +0200")
References: <20190528203416.32261-1-thomas.petazzoni@bootlin.com>
 <20190528203416.32261-2-thomas.petazzoni@bootlin.com>
Message-ID: <87ftow44fd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > jimtcl, perl, usb_modeswitch and x264 are registering
 > UPDATE_CONFIG_HOOK as a post patch hook to get their gnuconfig files
 > updated. lmbench is the only package calling CONFIG_UPDATE directly,
 > so for consistency, let's make it use the same logic as jimtcl, perl,
 > usb_modeswitch and x264.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
