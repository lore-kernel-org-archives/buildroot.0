From: Paul Jones <paul@pauljones.id.au>
Date: Thu, 24 Jun 2010 20:56:23 +1000
Subject: [Buildroot] How to Login in a filesystem as a root
In-Reply-To: <SNT127-W419F4B2391D74166A2B60B7C60@phx.gbl>
References: <SNT127-W619D09ED5AF2F021B401ACB7C60@phx.gbl><20100624094558.7d1ff7da@surf>,
	<AANLkTik5FwI48yklM-2mvxv1XKHJGm6ChSc6K0Rexd0v@mail.gmail.com>
	<SNT127-W419F4B2391D74166A2B60B7C60@phx.gbl>
Message-ID: <001601cb138b$e4401d20$acc05760$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've had this problem a few times before. It seems to happen if the kernel
and rootfs are built with different toolchains (even the same version) that
have different options for things like wchar. I never did figure it out but
the issue seems to have gone away for now.

 

 

Paul

 

 

From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net]
On Behalf Of amr ali
Sent: Thursday, 24 June 2010 8:50 PM
To: mjd+buildroot at afork.com
Cc: Busy Box Forum
Subject: Re: [Buildroot] How to Login in a filesystem as a root

 

I checked the passwd and shadow files, they have a root user but whenever I
type root at login it give invalid login.
May be you are right. I need to read more about buildroot. I can send you my
configuration files if possible to check it yourself.
--
Amr Ali Abdel-Naby
Embedded Systems Developer
www.embedded-tips.blogspot.com



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100624/861ff072/attachment-0001.html>
