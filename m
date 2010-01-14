From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Jan 2010 10:23:48 +0100
Subject: [Buildroot] [pull request] Pull request for branch
 uclibc-0.9.30.2
In-Reply-To: <cover.1263460719.git.thomas.petazzoni@free-electrons.com>
References: <cover.1263460719.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20100114102348.7328dbd4@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 14 Jan 2010 10:18:43 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

>       Add uClibc 0.9.30.2

I'm testing it right now. I've just sent the patch early to avoid
duplicate work.

Concerning the patches that we have on uClibc 0.9.30.1:

 * uClibc-0.9.30.1-64bit-strtouq.patch

   Fixed by a7cd0cf2a31493506795528125a1d87428b67374

 * uClibc-0.9.30.1-arm-fix-linuxthreads-sysdep.patch

   Apparently fixed by 721ad11a13423115831da863fb5c5bbd0f340adb

 * uClibc-0.9.30.1-c99-ldbl-math.patch

   Fixed by aa148d76e87a63863808529a6687d053adc5a46d

 * uClibc-0.9.30.1-dl-sysdep-inline.patch

   Fixed by f12e73b50c47896faf4498a5085f9bfbd828a1c3

 * uClibc-0.9.30.1-fix-getaddrinfo.patch

   Fixed by 65119bba48b4ec904e81e99b701c8388afdb09a0

 * uClibc-0.9.30.1-unifdef-getline.patch

   Fixed by 27a28684fa518d92af24266eadc5d2efcc152104

So it looks like all the patches we were carrying for uClibc 0.9.30.1
have been merged upstream.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
