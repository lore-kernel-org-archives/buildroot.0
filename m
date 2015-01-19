From: Lou Crittenden <loucrittenden63@gmail.com>
Date: Sun, 18 Jan 2015 22:46:56 -0600
Subject: [Buildroot] setting up xorg in buildroot
Message-ID: <CAFGceHEBvOKS3J87otvRnpWWQ=ZNjKBkzrntrf7irfLEzhZA+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was wondering how to set up X in buildroot to work with the waveshare32b
display, and to where it will work with the touchscreen we got working
earlier. I have xorg and xorg-server installed, but when I run it as root,
it outputs: "*Caught signal 11 (Segmentation fault). Server aborting*" when
I run it on my raspberry pi. It outputs "server must be suid root", but
oddly when I run it in a qemu-based raspberry pi emulator, it starts up,
but I can't use a keyboard or mouse. I was also able to get X to start up
at boot by editing /etc/init.d/rcs, but with the same symptoms.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150118/c3c7041d/attachment.html>
