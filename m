From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 19:49:22 +0100
Subject: [Buildroot] 2009.02-rc2 released
In-Reply-To: <497E0152.9040403@gmail.com> (Robert Nelson's message of "Mon\,
	26 Jan 2009 12\:30\:42 -0600")
References: <87skn9iv5w.fsf@macbook.be.48ers.dk> <497DF1CC.2010404@gmail.com>
	<873af66k0f.fsf@macbook.be.48ers.dk> <497E0152.9040403@gmail.com>
Message-ID: <87y6wx6gy5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Robert" == Robert Nelson <robert.nelson.work@gmail.com> writes:

 >> That's a known issue. We don't (yet) build a host version of glib, so
 >> you need to have the the glib development package (something like
 >> libglib2.0-dev) installed.
 >> 
 >> I'll fix the tree to atleast give you a clearer error message if you
 >> don't have a host glib-genmarshal.


 Robert> Sorry for the noise guys... (ssh'd into the wrong test box.. didn't
 Robert> have libglib2.0-dev installed..)

No problem, we should fix the host-glib issue sooner or later. I
checked in a test for it in r25057.

 Robert> Currently rebuilding the avr32 targets... (I have ngw100's and
 Robert> stk1000's I can test here..)

Great.

-- 
Bye, Peter Korsgaard
