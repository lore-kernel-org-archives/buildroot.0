From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 31 Jan 2011 15:09:43 +0100
Subject: [Buildroot] FW: x11vnc compile error
In-Reply-To: <35FC1A56EEC91A42A0EB92079193ED8D02E6E24C@ASISML10.asia-idc.local>
	(Feng Yang's message of "Mon, 31 Jan 2011 16:25:59 +0800")
References: <35FC1A56EEC91A42A0EB92079193ED8D02E6E24C@ASISML10.asia-idc.local>
Message-ID: <87pqrdw4ew.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Feng" == Feng Yang <feng.yang.xb@renesas.com> writes:

 Feng> Hi,
 Feng> My name is Feng and come from Taiwan, as title, I build x11vnc package in
 Feng> buildroot-2010.08.

 Feng> My CPU core is SuperH 4A.

 Feng> Would you mind give me some suggestion to fix error?

 Feng> following is the error message.

Seems like it ends up including host header files, which causes the
break. Could you try adding xlib_libXt to your build? With that added,
it builds here on powerpc with latest git.

-- 
Bye, Peter Korsgaard
