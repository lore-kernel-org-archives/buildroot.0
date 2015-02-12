From: Lou Crittenden <loucrittenden63@gmail.com>
Date: Thu, 12 Feb 2015 17:35:32 -0600
Subject: [Buildroot] setting up directfb for a raspberry pi + waveshare32b
	display
Message-ID: <CAFGceHHVON4+YaUD86q2o_ATAqrpt=tFvjG48NGUUExr9DTz4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all. I have a buildroot setup running on a raspberry pi model b+ and a
waveshare32b 3.2" display and was able to get the system to work with the
display thanks to peter seiderer's awesome patch that builds the fbtft
drivers for buildroot, but I now would like to set up directfb to work on
this setup. Directfb built nicely, along with sdl and qt5 (I'm setting up
the framework for a gui on a buildroot based media player), but I cannot
get anything to work on directfb. I run the command "df_drivertest" that
tests for the driver, and it gives a

(#) DirectFBError [dfb->CreateSurface( dfb, &dsc, &primary )]: The
requested operation or an argument is (currently)Not
supported.

The same thing happens when I try to run any of their directfb demos.
I went on their site, directfb.org, and a lot of the links that would
help are dead


I want to use a setup lighter than xorg and supports touchscreen for a
gui on a multimedia player I am working on.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150212/e8f03466/attachment.html>
