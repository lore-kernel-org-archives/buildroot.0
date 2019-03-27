From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 10:48:11 +0100
Subject: [Buildroot] [PATCH v2] package/x11r7/xdriver_xf86-video-fbdev:
 bump to version 0.5.0
In-Reply-To: <1552775830-13211-1-git-send-email-michel.stempin@wanadoo.fr>
 (Michel Stempin's message of "Sat, 16 Mar 2019 23:37:10 +0100")
References: <1552775231-12318-1-git-send-email-michel.stempin@wanadoo.fr>
 <1552775830-13211-1-git-send-email-michel.stempin@wanadoo.fr>
Message-ID: <87a7hgtzqc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michel" == Michel Stempin <michel.stempin@wanadoo.fr> writes:

 > Starting X manually resulted in a symbol error:
 > | Xorg: symbol lookup error:
 > /usr/lib/xorg/modules/drivers/fbdev_drv.so: undefined symbol:
 > shadowUpdatePackedWeak

 > This bug was reported against the fbdev driver, which is fixed
 > upstream in 0.5.0:

 > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=900317

 > v1 --> v2 Fixed typo in comment line

 > Signed-off-by: Michel Stempin <michel.stempin@wanadoo.fr>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
