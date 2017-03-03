From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Mar 2017 00:02:43 +0100
Subject: [Buildroot] [PATCH] linux: Add CIP SLTS easy selection option
In-Reply-To: <7663394e-1ac6-07ae-a226-159605ac4011@mind.be>
References: <1488577816-19047-1-git-send-email-angelo.compagnucci@gmail.com>
 <20170303234636.0dbf4fd6@free-electrons.com>
 <7663394e-1ac6-07ae-a226-159605ac4011@mind.be>
Message-ID: <20170304000243.35b8b146@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 3 Mar 2017 23:50:54 +0100, Arnout Vandecappelle wrote:

>  In addition, I have yet to meet an actual embedded system product that uses an
> unpatched kernel. In practice, the CIP kernel is going to be the _base_ of a
> product, and not used directly.
> 
>  That said, it would be useful to add a defconfig that makes use of that kernel.

I don't really see how that would be useful. What would it bring
exactly?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
