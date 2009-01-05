From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 Jan 2009 09:53:39 +0100
Subject: [Buildroot] shell issues when /bin/sh is 'dash' instead of
	'bash'
In-Reply-To: <alpine.LFD.2.00.0901041650200.26118@xanadu.home> (Nicolas
	Pitre's message of "Sun\, 04 Jan 2009 16\:53\:41 -0500 \(EST\)")
References: <bbbeeccd0812311504p2e7f96a6l923c938acac8acf0@mail.gmail.com>
	<20090101023620.GA13399@cloud.net.au>
	<alpine.LFD.2.00.0901041650200.26118@xanadu.home>
Message-ID: <87aba6yvzg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Pitre <nico@cam.org> writes:

Hi,

 >> dash(1) on my system says -ot is supported anyway. If not perhaps it can
 >> be expressed in a better way; I think that would be better than this
 >> fix.

 Nicolas> There are other places where brace expansion is used for arguments to 
 Nicolas> patch-kernel.sh, and dash doesn't supports that.  You end up with a 
 Nicolas> kernel missing appropriate patches, etc.

Exactly. The best way forward is imho to always use bash like what
current svn is doing.

-- 
Bye, Peter Korsgaard
