From: George Georgopoulos <ggeorg@arkasoft.com>
Date: Tue, 6 Jan 2015 13:01:04 +0200
Subject: [Buildroot] weston rpi-backend.so failed to load
Message-ID: <36562DDE-7762-4151-8F68-8CF5540BB65F@arkasoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

just build buildroot for raspberry pi with waylaid/weston - my problem when I start weston with the rpi-backend is that I get a

?Failed to load module: File not found? as you can see from the screenshot:

 http://postimg.org/image/uk5tjco4n/full/ <http://postimg.org/image/uk5tjco4n/full/>

When I run weston with frame buffer  backend it works (but its slow).

The problem is that I get those ?can?t resolve symbol? error for vcos_ symbols - libvcos.so is in /usr/lib

I use the latest stable release: 2014.11

Kind Regards,
George.


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150106/13fa8c99/attachment-0001.html>
