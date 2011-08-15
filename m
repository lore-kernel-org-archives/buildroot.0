From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 15 Aug 2011 17:24:54 +0300
Subject: [Buildroot] /run/udev missing ?
In-Reply-To: <1313416862.29966.2.camel@sven>
References: <1313137798.1017.5.camel@sven> <87ty9kh4sh.fsf@macbook.be.48ers.dk>
 <1313396462.31752.3.camel@sven>
 <878vqvgi3g.fsf@macbook.be.48ers.dk>
 <1313400852.26653.4.camel@sven>
 <874o1iho3k.fsf@macbook.be.48ers.dk>
 <1313416862.29966.2.camel@sven>
Message-ID: <20110815142453.GB22429@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sven,

On Mon, Aug 15, 2011 at 04:01:02PM +0200, Sven Neumann wrote:
> Still I wonder why udevd is looking for "/run/udev". Shouldn't this
> be /var/run/udev ? Looks to me like udevd is configured with a wrong
> prefix for the run directory.

/run is a newly introduced toplevel directory for early boot runtime data. See 
http://lwn.net/Articles/436012/.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
