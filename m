From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 18 Oct 2008 20:55:29 +0200
Subject: [Buildroot] Madplay improved patch for alsa audio
In-Reply-To: <gdcqmh$tuu$1@ger.gmane.org> (Micha Nelissen's message of "Sat\,
	18 Oct 2008 16\:08\:26 +0200")
References: <gdcqmh$tuu$1@ger.gmane.org>
Message-ID: <87od1hivha.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Micha" == Micha Nelissen <micha@neli.hopto.org> writes:

 Micha> Hi,
 Micha> Attached is an improved patch for alsa backend of madplay.
 Micha> * fix allocation of buffer, buffer_size is number of frames
 Micha> * use default 16 bit depth (some hardware has small buffers, 16/24 bit
 Micha> difference is very small)

Have you sent this upstream? I don't right away see any in the mad-dev
archive.

-- 
Bye, Peter Korsgaard
