From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Nov 2012 22:30:13 +0100
Subject: [Buildroot] [PATCH v2] kexec: disable on avr32
In-Reply-To: <1352796707-9197-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Tue, 13 Nov 2012 08:51:47 +0000")
References: <1352796707-9197-1-git-send-email-spdawson@gmail.com>
Message-ID: <87boez98ka.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>

 spdawson> kexec does not support the avr32 architecture; this results
 spdawson> in autobuilder failures such as the following.

Committed, thanks.

-- 
Bye, Peter Korsgaard
