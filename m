From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Nov 2013 22:37:38 +0100
Subject: [Buildroot] [PATCH] avr32: pass target arch to gcc
In-Reply-To: <1383767110-32444-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Wed, 6 Nov 2013 19:45:10 +0000")
References: <1383767110-32444-1-git-send-email-spdawson@gmail.com>
Message-ID: <87iow5ky8t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > As suggested with Alexander Lukichev and Thomas Petazzoni on the mailing list,
 > only one of the two avr32 microarchitectures is relevant for Buildroot: avr32
 > Linux implies the avr32b microarchitecure, as used in the ap7000.

 > Signed-off-by: Simon Dawson <spdawson@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
