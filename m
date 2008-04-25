From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 25 Apr 2008 10:09:50 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  oprofile
In-Reply-To: <20080425064853.GA1525@cloud.net.au>
References: <20080424165429.5E3993C7F0@busybox.net>
	<87zlrj2khz.fsf@macbook.be.48ers.dk>
	<20080425064853.GA1525@cloud.net.au>
Message-ID: <20080425080950.GA12947@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 25, 2008 at 04:48:53PM +1000, Hamish Moffatt wrote:
>On Thu, Apr 24, 2008 at 08:08:56PM +0200, Peter Korsgaard wrote:

>> Does that actually work? I mean, does the compiler get recompiled with
>> C++ support if you select this package after your initial make?
>
>I doubt it.. I think it's quite difficult to get gcc recompiled after
>changing the options - usually means deleting most (if not all) of
>toolchain_build_$arch.

of course toggling toolchain-related options does rebuild the needed
parts and dependencies properly in my tree..
