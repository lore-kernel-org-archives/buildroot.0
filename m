From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 9 Mar 2007 09:35:03 +0100
Subject: [Buildroot] [RFC/PATCH 1/3] fix buildroot sed handling on Mac
	OS X
In-Reply-To: <45F081D6.3050803@cs.helsinki.fi>
References: <45E1717E.1030305@cs.helsinki.fi> <20070308163500.GC1389@aon.at>
	<45F081D6.3050803@cs.helsinki.fi>
Message-ID: <20070309083503.GB11011@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 08, 2007 at 11:36:22PM +0200, Heikki Lindholm wrote:
>Bernhard Fischer kirjoitti:
>>On Sun, Feb 25, 2007 at 01:22:38PM +0200, Heikki Lindholm wrote:
>>
>>>Improve the checking of sed by adding some common GNU sed installation
>>>names (gsed/gnused), checking for a basic OS X sed feature in command
>>>line option handling, checking the actual result of the sed run against
>>>the expected result, and placing common code for the check under
>>>toolchain/dependencies/.

Applied. Will most likely be moved from diff to cmp since we already use
cmp (IIRC, didn't look). Care to verify if cmp is already used and if
so, use cmp instead?

TIA,
