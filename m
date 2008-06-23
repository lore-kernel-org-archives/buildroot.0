From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Mon, 23 Jun 2008 12:10:20 +0200
Subject: [Buildroot] GIT or SVN
In-Reply-To: <20080620132413.GF12682@mx.loc>
References: <485A3396.80701@cetrtapot.si> <87iqw5dyyb.fsf@macbook.be.48ers.dk>
	<20080620083646.GB12682@mx.loc> <485B6CF6.7040901@cetrtapot.si>
	<20080620125720.GE12682@mx.loc> <485BAD8B.4030008@cetrtapot.si>
	<20080620132413.GF12682@mx.loc>
Message-ID: <485F768C.2050708@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:

>> (const_int -13 [0xfffffff3])
>> net/core/stream.c: In function 'sk_stream_wait_connect':
>> net/core/stream.c:78: internal compiler error: output_operand: invalid operand for 'p' modifier
>> Please submit a full bug report,
>> with preprocessed source if appropriate.
>> See <http://gcc.gnu.org/bugs.html> for instructions.
> 
> Well, you should do that and/or try gcc-trunk or another kernel, i suppose :)

I've filled a bug report in gcc bugzilla for this.
See http://gcc.gnu.org/bugzilla/show_bug.cgi?id=36482.

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
