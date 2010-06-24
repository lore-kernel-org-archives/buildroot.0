From: Mitch Davis <mjd+buildroot@afork.com>
Date: Thu, 24 Jun 2010 21:50:28 +1000
Subject: [Buildroot] How to Login in a filesystem as a root
In-Reply-To: <SNT127-W419F4B2391D74166A2B60B7C60@phx.gbl>
References: <SNT127-W619D09ED5AF2F021B401ACB7C60@phx.gbl>
	<20100624094558.7d1ff7da@surf> 
	<AANLkTik5FwI48yklM-2mvxv1XKHJGm6ChSc6K0Rexd0v@mail.gmail.com> 
	<SNT127-W419F4B2391D74166A2B60B7C60@phx.gbl>
Message-ID: <AANLkTilQopdmVT0Z3UN5Nz1POtWNmjbbJ92ymD-8QrZ4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2010/6/24 amr ali <amraldo@hotmail.com>:
> I checked the passwd and shadow files, they have a root user but whenever I
> type root at login it give invalid login.
> May be you are right. I need to read more about buildroot. I can send you my
> configuration files if possible to check it yourself.

Do you have a file on your DaVinci called "/etc/securetty"?  If so,
what's in it?

Mitch.
