From: Attila Kinali <attila@kinali.ch>
Date: Fri, 13 Apr 2012 09:56:03 +0200
Subject: [Buildroot] Kernel does not boot on I.MX28
In-Reply-To: <63D6870D443E63419AC4A0C97B86C0920D358F816B@MBXCLUSTER.mdh.local>
References: <63D6870D443E63419AC4A0C97B86C0920D358F816B@MBXCLUSTER.mdh.local>
Message-ID: <20120413095603.b65508a9d94d73d3a694c2ed@kinali.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

God morgon!

On Fri, 13 Apr 2012 09:38:58 +0200
Mikael ?sberg <mikael.asberg@mdh.se> wrote:

> I'm trying to run a kernel on a I.MX28 EVK board.
> I'm using u-boot (from LTIB) on a SD card to boot my kernel.
> 

Make sure you use /dev/ttyAMA0 as console and not ttyAM0
as mentioned in the LTIB documentation.

			Attila Kinali

-- 
The trouble with you, Shev, is you don't say anything until you've saved
up a whole truckload of damned heavy brick arguments and then you dump
them all out and never look at the bleeding body mangled beneath the heap
		-- Tirin, The Dispossessed, U. Le Guin
