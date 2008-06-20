From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 20 Jun 2008 15:24:13 +0200
Subject: [Buildroot] GIT or SVN
In-Reply-To: <485BAD8B.4030008@cetrtapot.si>
References: <485A3396.80701@cetrtapot.si> <87iqw5dyyb.fsf@macbook.be.48ers.dk>
	<20080620083646.GB12682@mx.loc> <485B6CF6.7040901@cetrtapot.si>
	<20080620125720.GE12682@mx.loc> <485BAD8B.4030008@cetrtapot.si>
Message-ID: <20080620132413.GF12682@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 20, 2008 at 03:15:55PM +0200, Hinko Kocevar wrote:
>Bernhard Fischer wrote:
>> On Fri, Jun 20, 2008 at 10:40:22AM +0200, Hinko Kocevar wrote:
>> 
>>> With gcc 4.3.1 gcc internal errors went away, so I'm really glad I found the GIT tree!
>> 
>> I have improved (i hope) the cris support, configuration-wise, please
>> pull and let me know if it suits your needs.
>> 
>
>Nice. I'm trying it out right now..
>
>BTW:
>Have you successfully compiled linux 2.6.25.x kerne?l with cris toolchain? Mine fails with:

No, just uClibc trunk, i don't have the time nor cycles for this.

>(const_int -13 [0xfffffff3])
>net/core/stream.c: In function 'sk_stream_wait_connect':
>net/core/stream.c:78: internal compiler error: output_operand: invalid operand for 'p' modifier
>Please submit a full bug report,
>with preprocessed source if appropriate.
>See <http://gcc.gnu.org/bugs.html> for instructions.

Well, you should do that and/or try gcc-trunk or another kernel, i suppose :)
