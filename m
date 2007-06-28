From: Paul Kavan <pkavan@gmail.com>
Date: Thu, 28 Jun 2007 14:46:51 -0500
Subject: [Buildroot] ALSA Build Crashes in buildroot
Message-ID: <61c0054e0706281246t1abb96f3xa9687f9c65d2d24f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all:

Trying to include the alsa libs and utils in buildroot. However, buildroot
terminates make with:

.
.
.
../src/.libs/libasound.so: undefined reference to `snd_hwdep_info_get_name'
../src/.libs/libasound.so: undefined reference to
`snd_rawmidi_info_get_name'
../src/.libs/libasound.so: undefined reference to `snd_rawmidi_info_sizeof'
../src/.libs/libasound.so: undefined reference to
`snd_rawmidi_info_set_device'
../src/.libs/libasound.so: undefined reference to
`snd_hwdep_info_set_device'
../src/.libs/libasound.so: undefined reference to `snd_hwdep_info_sizeof'
../src/.libs/libasound.so: undefined reference to
`snd_rawmidi_info_set_stream'
collect2: ld returned 1 exit status
make[2]: *** [aserver] Error 1
make[2]: Leaving directory
`/home/grhuser/Linux_Builds/buildroot/build_arm/alsa-lib-1.0.14/aserver'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory
`/home/grhuser/Linux_Builds/buildroot/build_arm/alsa-lib-1.0.14'
make: *** [/home/grhuser/Linux_Builds/buildroot/build_arm/alsa-lib-1.0.14/.compiled]
Error 2

Any clues as to why it is doing this?

Thanks.

Paul

-- 
***************************************
Paul David Kavan
Project Engineer
GRH Electronics, Inc.
402-734-4900
pkavan at gmail.com
***************************************
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070628/15b1934d/attachment.htm 
