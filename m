From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Mar 2012 17:38:36 +0100
Subject: [Buildroot] [PATCH 1/3] intltool: no business defining PERLLIB
In-Reply-To: <87ipi0ims7.fsf@macbook.be.48ers.dk>
References: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
 <1331517531-2291-2-git-send-email-gustavo@zacarias.com.ar>
 <20120319163011.27d669d2@skate>
 <d393625cf8a0f0af32c086413b19b091@zacarias.com.ar>
 <20120319165731.4d3374cd@skate>
 <87ipi0ims7.fsf@macbook.be.48ers.dk>
Message-ID: <20120319173836.107d5c6c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 19 Mar 2012 17:22:00 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  >> Reverted? It was never applied.
> 
>  Thomas> Sorry, my bad, I thought it had been applied and was the reason of the
>  Thomas> failure. I will investigate what is causing this new breakage.
> 
> It was afaik the microperl -> gentargets change.

Ah, yes, on the failed cases, I have BR2_PACKAGE_MICROPERL=y.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
