From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 21 Aug 2007 15:32:08 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
In-Reply-To: <0708202018120.9013@somehost>
References: <20070820130014.12B6AA466E@busybox.net>
	<00c801c7e345$cb1db9c0$dcc4af0a@atmel.com>
	<0708202018120.9013@somehost>
Message-ID: <20070821133208.GA17177@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 20, 2007 at 08:18:46PM +0200, Cristian Ionescu-Idbohrn wrote:
>On Mon, 20 Aug 2007, Ulf Samuelsson wrote:
>
>> Thanks, maybe we should have a script which is periodically run to find
>> the white space stuff and remove it.
>
>Easiest is to avoid putting it there, IMHO.

Agree. Not adding code that breaks the established style is the proper
thing to do. Automated fixup is not a solution nor desirable. It's not
that avoiding silly whitespace damage should be _that_ hard (modulo in
an X11 impl or the like ;).
