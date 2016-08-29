From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Aug 2016 23:02:39 +0200
Subject: [Buildroot] [git commit] libiio: Disable IIOD on Blackfin
In-Reply-To: <87h9a347g6.fsf@dell.be.48ers.dk>
References: <20160829155904.75EC780269@busybox.osuosl.org>
 <20160829180407.2e54e0e2@free-electrons.com>
 <87h9a347g6.fsf@dell.be.48ers.dk>
Message-ID: <20160829230239.27f7e148@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 Aug 2016 22:59:53 +0200, Peter Korsgaard wrote:

>  > Most likely this is wrong. The failure happens with the old Blackfin
>  > toolchain from ADI. Was it tested to also happen with the new Blackfin
>  > toolchain, that uses recent kernel headers and recent uClibc-ng ?  
> 
> Yes, I did a build with gcc 6.x and checked the 4.7.2 kernel
> headers. The accept4 syscall doesn't seem to be wired up on bfin.

Gah, ok. My bad, then :-/

Sorry for the noise,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
