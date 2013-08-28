From: Assaf Inbal <shmuelzon@gmail.com>
Date: Wed, 28 Aug 2013 07:41:09 +0300
Subject: [Buildroot] [PATCH v2 1/2] getty: Create specific getty config
	+ cleanups
In-Reply-To: <CAAXf6LV4mAJ77obaOx_7O9Dk_=a9oFGrW8QcFoAzdAKThAqjLA@mail.gmail.com>
References: <1377429219-25140-1-git-send-email-shmuelzon@gmail.com>
 <CAAXf6LV4mAJ77obaOx_7O9Dk_=a9oFGrW8QcFoAzdAKThAqjLA@mail.gmail.com>
Message-ID: <CADwac6BfHWKP_HWd_3g6t8MqtSW4zTcpYbChpbPh0O3q-N4=Jg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Thomas,

The text of the suboptions to the new getty top-level option are still
> somewhat chaotic:
> [*] Run a getty (login prompt) after boot
> (ttyS0) Port to run a getty (login prompt) on
> Baudrate to use (115200)  --->
> (vt100) Value to assign the TERM environment variable
> ()    other options to pass to getty
>
>
> My proposal is to simplify the suboptions:
> [*] Run a getty (login prompt) after boot
> (ttyS0) tty port
> baudrate (115200)  --->
> (vt100) TERM environment variable
> ()    other options to pass to getty
>

Would you like to me submit another version of the patch with your wording,
or will you do this yourself when applying the patch?

Good day,
Assaf
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130828/3ef3326e/attachment.html>
