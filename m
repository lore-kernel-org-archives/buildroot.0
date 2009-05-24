From: Sven Neumann <s.neumann@raumfeld.com>
Date: Sun, 24 May 2009 23:53:44 +0200
Subject: [Buildroot] trouble with FUSE (Filesystem in Userspace)
In-Reply-To: <871vqefcth.fsf@macbook.be.48ers.dk>
References: <1240326220.8272.4.camel@sven> <871vqefcth.fsf@macbook.be.48ers.dk>
Message-ID: <1243202024.7047.1.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, 2009-05-24 at 22:47 +0200, Peter Korsgaard wrote:

>  Sven> we are using buildroot on an ARM platform with uCLibC 0.9.30.1
>  Sven> and Linux 2.6.30rc2 and can't get FUSE to work. I tried the
>  Sven> simple hello.c example from the fuse-2.7.3 sources and
>  Sven> everything seems to work fine until I try to read from the
>  Sven> filesystem. This read blocks forever. Now I wonder if anyone on
>  Sven> this list has ever got FUSE and uCLibC to work on an ARM or if
>  Sven> there are known problems with this combination? Any help would
>  Sven> be much appreciated as I am running out of ideas here...
> 
> Not on ARM, but I'm using it on PPC without any problems.
> 
> Are you using EABI or OABI?

EABI. We gave up on fuse and now use GIO instead.


Sven
