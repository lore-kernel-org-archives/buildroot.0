From: Heikki Lindholm <holindho@cs.helsinki.fi>
Date: Fri, 09 Mar 2007 21:28:39 +0200
Subject: [Buildroot] [RFC/PATCH 1/3] fix buildroot sed handling on Mac
 OS X
In-Reply-To: <20070309083503.GB11011@aon.at>
References: <45E1717E.1030305@cs.helsinki.fi> <20070308163500.GC1389@aon.at>
	<45F081D6.3050803@cs.helsinki.fi> <20070309083503.GB11011@aon.at>
Message-ID: <45F1B567.5020902@cs.helsinki.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer kirjoitti:
> On Thu, Mar 08, 2007 at 11:36:22PM +0200, Heikki Lindholm wrote:
> 
>>Bernhard Fischer kirjoitti:
>>
>>>On Sun, Feb 25, 2007 at 01:22:38PM +0200, Heikki Lindholm wrote:
>>>
>>>
>>>>Improve the checking of sed by adding some common GNU sed installation
>>>>names (gsed/gnused), checking for a basic OS X sed feature in command
>>>>line option handling, checking the actual result of the sed run against
>>>>the expected result, and placing common code for the check under
>>>>toolchain/dependencies/.
> 
> 
> Applied. Will most likely be moved from diff to cmp since we already use
> cmp (IIRC, didn't look). Care to verify if cmp is already used and if
> so, use cmp instead?

I found no cmp usage in buildroot. How about just using the shell as in 
the attached patch?

-- Heikki Lindholm
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-070309-sed-diff.patch
Url: http://busybox.net/lists/buildroot/attachments/20070309/68d32a7a/attachment.pot 
