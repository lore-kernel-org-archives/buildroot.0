From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Aug 2016 10:34:02 -0700
Subject: [Buildroot] Unable to choose libgtk3 when using rpi-userland
	package
In-Reply-To: <trinity-13a6383e-07ec-45b6-b051-a97025e073e3-1471607022160@3capp-gmx-bs60>
References: <trinity-13a6383e-07ec-45b6-b051-a97025e073e3-1471607022160@3capp-gmx-bs60>
Message-ID: <08E7F0B7-5937-4810-8D59-4E5B2F98D5B9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Aug 19, 2016, at 4:43 AM, Michael Toldo <Michael_Toldo@gmx.net> wrote:
> 
> Hi everybody,
> 
> I'm trying to set up buildroot for my Raspberry Pi so I can use it as a lightweight kiosk device. For this I want to install Midori which is based on the libgtk3.
> When using rpi-userland (OpenGL is included there) I cannot select the libgtk3 package. Following info is displayed: *** libgtk3 needs an OpenGL or OpenGL EGL backend provided by mesa3d ***


Look into the build its most probably not able to deduce that userland supports it because the little tests it does for deciding that are failing.

> 
> Thanks for your help!
> 
> Regards,
> Mick
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160819/9aa77d80/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160819/9aa77d80/attachment.asc>
