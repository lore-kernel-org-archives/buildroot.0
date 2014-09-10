From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed, 10 Sep 2014 08:57:26 -0400
Subject: [Buildroot] google-breakpad client include path
Message-ID: <CA+-urNRQ2K1cTh--oxyth+RypQDCNee0XncwrWGJHHGjEKtmCw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm trying out google-breakpad and was wondering how others were handling
the include paths in their client applications. If you haven't used it, it
looks like you need to add some code to your main() so that the signal
handlers and crash dump logic can be linked into your application.

I'm working off the instructions at
https://code.google.com/p/google-breakpad/wiki/LinuxStarterGuide. As part
of the instructions, you need to add the google-breakpad source tree to
your application's include path. The header files do not get installed to
staging. It feels wrong to specify an include path to
output/build/google-breakpad-1320/src, but is this what others are doing?

Thanks,
Frank
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140910/85ef9127/attachment.html>
