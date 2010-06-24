From: Peter =?iso-8859-15?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Thu, 24 Jun 2010 13:02:16 +0200
Subject: [Buildroot] How to Login in a filesystem as a root
In-Reply-To: <SNT127-W419F4B2391D74166A2B60B7C60@phx.gbl>
References: <SNT127-W619D09ED5AF2F021B401ACB7C60@phx.gbl>
	<AANLkTik5FwI48yklM-2mvxv1XKHJGm6ChSc6K0Rexd0v@mail.gmail.com>
	<SNT127-W419F4B2391D74166A2B60B7C60@phx.gbl>
Message-ID: <201006241302.16401.PeterHuewe@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Donnerstag 24 Juni 2010 12:50:26 schrieb amr ali:
> I checked the passwd and shadow files, they have a root user but whenever I
>  type root at login it give invalid login. May be you are right. I need to
>  read more about buildroot. I can send you my configuration files if
>  possible to check it yourself. --
> Amr Ali Abdel-Naby
> Embedded Systems Developer
> www.embedded-tips.blogspot.com
>

Hi,
does the busybox binary on your target board belong to root?

I've had that issue once, that I managed to create it with an other owner as 
user.

Moreover I'm not sure if it might need the suid-bit set.


Peter
