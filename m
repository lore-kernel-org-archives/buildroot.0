From: thomas.cooksey at bt.com <thomas.cooksey@bt.com>
Date: Thu, 24 Aug 2006 14:13:26 +0100
Subject: [Buildroot] New(?) package - OLSR daemon
Message-ID: <0536FC9B908BEC4597EE721BE6A3538913868ADD@i2km07-ukbr.domain1.systemhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have put together a quick package for www.olsr.org's implementation of
the Optimized Link State Routing protocol. This is a daemon which does
multi-hop routing for mobile ad hoc wireless networks. I'm actually
using the gumstix buildroot branch, but it's a pretty simple package and
I can't see any reason why it wouldn't work with the regular buildroot.
I have also only tested it for an arm target, but again, it's a simple
package and should work for other targets too.

Would this be of interest to anyone?


Cheers,

Tom
