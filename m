From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Nov 2010 11:11:12 +0100
Subject: [Buildroot] xorg-server not using target cflags
In-Reply-To: <BAY145-w235510FA6AD15BE8E1516BC2230@phx.gbl> (Matt Johnson's
	message of "Sat, 27 Nov 2010 18:00:38 -0700")
References: <BAY145-w13F5F6FEBA012526351555C2220@phx.gbl>
	<87pqtq1mts.fsf@macbook.be.48ers.dk>
	<BAY145-w235510FA6AD15BE8E1516BC2230@phx.gbl>
Message-ID: <87d3pp21xb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Johnson <mj1856@hotmail.com> writes:

Hi,

 >> Thanks, committed. Could you in the future use unified diffs (diff
 >> -u), please? - Or even better use git and 'git format-patch'.
 >> 

 Matt> Will do.  Like I said, I'm new here.  :)

Great.
 
 Matt> BTW - I'm having similar Illegal Instruction problems with
 Matt> fontconfig and freetype.  I will post back when I have solutions
 Matt> for those.  I'm all ears if you have suggestions - as I don't see
 Matt> the same CFLAGS issue as the main xserver package.

I atleast see a CFLAGS override in the fontconfig package, so that might
be why.

-- 
Bye, Peter Korsgaard
