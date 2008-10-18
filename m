From: Micha Nelissen <micha@neli.hopto.org>
Date: Sat, 18 Oct 2008 16:08:26 +0200
Subject: [Buildroot] Madplay improved patch for alsa audio
Message-ID: <gdcqmh$tuu$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Attached is an improved patch for alsa backend of madplay.
* fix allocation of buffer, buffer_size is number of frames
* use default 16 bit depth (some hardware has small buffers, 16/24 bit 
difference is very small)

Regards,

Micha
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: madplay-audio-alsa.patch
Url: http://busybox.net/lists/buildroot/attachments/20081018/329bfa92/attachment.txt 
