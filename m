From: Lou Crittenden <loucrittenden63@gmail.com>
Date: Thu, 15 Jan 2015 15:44:42 -0600
Subject: [Buildroot] Setting up audio/video playback backends on raspberry pi
Message-ID: <CAFGceHE53EiS632nzCV68LDWzupYYU0akKpHwKphVrDTaw93Yg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all, I am in the process of setting up a minimalist buildroot based
touchscreen multimedia player and was wondering how to get the audio and
video backends working properly. I can play a file with mplayer (no
arguments) from the console and there is no sound. I also have alsautils
and pulseaudio installed, as well as the gstreamer framework, but still no
go. I would like to get some info on how to configure it, please. For the
display, I have one of those waveshare32b displays I got working thanks to
Peter Seiderer's help (thanks Peter!). I'm now on the audio and video
playback backend configuration stages.

Included in the attachment is my buildroot configuration.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150115/0b4c7c9d/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 80244 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150115/0b4c7c9d/attachment-0001.obj>
