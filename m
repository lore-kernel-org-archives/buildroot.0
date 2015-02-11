From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Feb 2015 07:02:18 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-02-09
In-Reply-To: <87siee18ip.fsf@dell.be.48ers.dk>
References: <20150210073014.E19721010F3@stock.ovh.net>
 <87siee18ip.fsf@dell.be.48ers.dk>
Message-ID: <20150211070218.4f7ab59b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 10 Feb 2015 09:21:50 +0100, Peter Korsgaard wrote:

> >       mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/d3f123367559c758649c6da0ee4df528cb2d4682/
>  >       mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/cd713c2513cd1eb39b657504203338c4b7f5c887/
>  >       mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/0220ecb696a742641b83949f187d2d74e442f48a/
> 
> Didn't we already blacklist those uClibc/MIPS toolchains?

Yes, but the script isn't necessarily up-to-date on all the autobuilder
instances. I updated it on my instance yesterday, I should probably
send a notification to all people running autobuilder instances.

It's an issue we discussed at the Buildroot meeting, but there's no
simple way to handle this problem, without making the script update
itself, which isn't that nice from a security PoV since it means I
could be pushing whatever code I want to all the autobuilder instances,
without the owner of those instances noticing.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
