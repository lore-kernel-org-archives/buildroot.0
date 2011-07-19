From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Jul 2011 13:23:36 +0200
Subject: [Buildroot] devtmpfs and initramfs
In-Reply-To: <87aaca4l1y.fsf@macbook.be.48ers.dk>
References: <201107191222.19313.arnout@mind.be>
 <87aaca4l1y.fsf@macbook.be.48ers.dk>
Message-ID: <201107191323.36347.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tuesday 19 July 2011 12:33:13, Peter Korsgaard wrote:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>  Arnout>  I ended up adding the following to my inittab:
> 
>  Arnout> null::sysinit:/bin/mount -t devtmpfs devtmpfs /dev
> 
>  Arnout>  Does anyone know a more elegant solution?
> 
> Not really - Besides adding a devtmps_mount() call in kernel_init(), but
> that's kind of icky as well.

 We could of course use the same trick as for GENERIC_SERIAL...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
