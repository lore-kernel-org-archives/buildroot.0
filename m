From: =?iso-8859-1?Q?Mikael_=C5sberg?= <mikael.asberg@mdh.se>
Date: Fri, 13 Apr 2012 10:21:11 +0200
Subject: [Buildroot] Kernel does not boot on I.MX28
In-Reply-To: <20120413095603.b65508a9d94d73d3a694c2ed@kinali.ch>
References: <63D6870D443E63419AC4A0C97B86C0920D358F816B@MBXCLUSTER.mdh.local>,
 <20120413095603.b65508a9d94d73d3a694c2ed@kinali.ch>
Message-ID: <63D6870D443E63419AC4A0C97B86C0920D358F816C@MBXCLUSTER.mdh.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Tack!

I saw this (ttyAMA0) on a post in I.MX Community just before I read your e-mail =) and it works now!
But thx anyway!!

However, I'm very confused with one thing.
I have tried LTIB kernel as well, but I cannot get the gcc compiler (package) included in that kernel.
I just noticed that gcc is not included in the Buildroot kernel either?
I feel a bit stupid asking this but how do I include the gcc compiler package in the kernel configuration??

Regards

--------------------------------------------------------------
Mikael ?sberg
PhD student (Doktorand), Computer Engineering
School of Innovation, Design and Engineering
M?lardalen University, V?ster?s Sweden
Phone: +46(0)21 101502
Room nr: U1-145
Mail: mikael.asberg at mdh.se
--------------------------------------------------------------
________________________________________
Fr?n: Attila Kinali [attila at kinali.ch]
Skickat: den 13 april 2012 09:56
Till: Mikael ?sberg
Kopia: buildroot at busybox.net
?mne: Re: [Buildroot] Kernel does not boot on I.MX28

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
