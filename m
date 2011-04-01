From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 01 Apr 2011 22:10:30 +0200
Subject: [Buildroot] [xdriver_xf86-video-openchrome-0.2.904]
	via_video.c: error: 'struct _Pixmap' has no member named 'screen_x'
In-Reply-To: <1301664043.18237.38.camel@esp-patben-lin.espdx1.local> (Patryk
	Benderz's message of "Fri, 01 Apr 2011 15:20:43 +0200")
References: <1301422474.6206.37.camel@esp-patben-lin.espdx1.local>
	<1301664043.18237.38.camel@esp-patben-lin.espdx1.local>
Message-ID: <87lizt20nd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Patryk" == Patryk Benderz <Patryk.Benderz@esp.pl> writes:

 Patryk> [cut]
 >> Now make complains about:
 >> via_video.c: In function 'viaPaintColorkey':
 >> via_video.c:738:44: error: 'struct _Pixmap' has no member named 'screen_x'
 >> via_video.c:738:62: error: 'struct _Pixmap' has no member named 'screen_y'
 >> make[4]: *** [via_video.lo] Error 1

 Patryk> seems that snapshot from 2011-03-30 compiles openchrome correctly :)

That's surprising as there has been very little changes to the X11
packages since 2011.02-rc2, but OK - Good to know.

-- 
Bye, Peter Korsgaard
