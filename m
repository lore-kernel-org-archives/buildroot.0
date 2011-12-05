From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 5 Dec 2011 13:03:41 +0100
Subject: [Buildroot] Pre-RFC: clean integration of unclean packages
In-Reply-To: <CAAXf6LV85CrRSQbUbKgHBB4-uP6SHWcpDcbDFHo5dMekU5ee2g@mail.gmail.com>
References: <201112051046.38674.arnout@mind.be>
 <201112051108.12890.arnout@mind.be>
 <CAAXf6LV85CrRSQbUbKgHBB4-uP6SHWcpDcbDFHo5dMekU5ee2g@mail.gmail.com>
Message-ID: <201112051303.41429.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 05 December 2011 12:13:48 Thomas De Schampheleire wrote:
> > Note that the same Makefile.ti is used for all ti packages.
> 
> Could you gives us an idea of the contents of this file?
> Depending on its contents, this may be problematic: what if you update
> only one of the ti packages and it became incompatible with the
> existing Makefile.ti?
> But, if this Makefile.ti file is sufficiently general, I wouldn't be
> opposed to this principle.

 My Makefile.ti is currently still in flux.

 If you change or add a TI package, it may be necessary to modify Makefile.ti as well.  That's how I'm working now.  It should be possible to keep it compatible with the existing use cases.

> What if someone would really like the full xdctools for some reason?
> I think it'd be better to rename your package to something more
> specific, like xdctools-dep, or otherwise to have just one package but
> with two targets (with a different name, of course).

 Good point, I'll do that.

 Thank you for all your feedback!
 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
