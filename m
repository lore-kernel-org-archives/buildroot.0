From: Santhosh Ramani <srcoolz@gmail.com>
Date: Thu, 15 Jan 2015 11:03:38 -0600
Subject: [Buildroot] Qt4 Application - Touch detection
Message-ID: <CADKZYYLgvvnaur+Rc0J0UVshsQesEWZ2Feenb3WHA0gQztaKKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Everyone,

I am having some problems with running a Qt4 application with the buildroot
RFS. The application renders fine and the screen looks perfect but touch
detection does not work consistently and also seems to be off.

I have calibrated the touch with ts_calibrate and ts_test also works
perfectly. However when I run my app, touch detection doesn't work
properly. I have built my app in Qt 4.8.4 and used the libraries from the
TI SDK. I have also copied all the relevant libraries to the RFS and I
don't get any errors for library dependency.

When I enable the mouse pointer to be displayed in my application, I can
see that the pointer shows up in completely the wrong spot. But if I kill
my application and start the ts_test it works perfectly; that is how I can
know that the calibration is good.

Can someone please point me in the right direction? Thank you for your
help, it's much appreciated :)

Regards

Santhosh

-- 
Greater the Difficulty....Sweeter is the Victory
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150115/ee263cd8/attachment.html>
