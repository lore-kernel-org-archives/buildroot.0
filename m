From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 27 Jul 2007 18:21:54 +0200
Subject: [Buildroot] config update
In-Reply-To: <46A6E4C0.1080201@cs.helsinki.fi>
References: <469C604E.5060703@cs.helsinki.fi> <20070724123433.GA18856@aon.at>
	<46A63685.5060806@cs.helsinki.fi> <20070724181817.GC20613@aon.at>
	<46A6E4C0.1080201@cs.helsinki.fi>
Message-ID: <20070727162154.GF25147@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 25, 2007 at 08:50:56AM +0300, Heikki Lindholm wrote:
> Bernhard Fischer kirjoitti:

>> I'm curious if you need the same patch if you make menuconfig with e.g.
>> linux-2.6.21.5.
>
> 2.6.21* wont' work, but 2.6.22 has fixed the problem with linking. It also 
> doesn't have the foo.h problem at all.

Earlier today, i touched these curses affair. Perhaps it behaves now?

If not, then please pull the mconf from 2.6.22.x and send a diff for me
to apply

>> You're using 4.1.2 and there was a reason why i only enabled sysroot for
>> gcc >= 4.2.0 (IIRC sjhill changed this, so you're better off to ask him
>> why he enabled sysroot support for 4.1.2.. I figure that it worked for
>> him else he wouldn't have enabled it. Perhaps it was erroneously enabled,
>> i wouldn't know.)
>
> Maybe I'll just give 4.2.0 a shot, if that's the new standard(?)

actually the current stable and supported release is by now 4.2.1
