From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Nov 2016 02:04:31 +0100
Subject: [Buildroot] [PATCH 1/1] sdl: fix building on powerpc64 and
 powerpc64le
In-Reply-To: <20161107225106.5e9e61b6@free-electrons.com>
References: <a57a3d0430e248ee08148cef326cbf60283205ad.1478489382.git.sam.bobroff@au1.ibm.com>
 <20161107225106.5e9e61b6@free-electrons.com>
Message-ID: <53f345eb-3ea1-02ef-06bf-72f011b3728a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-11-16 22:51, Thomas Petazzoni wrote:
> Also, are we going to need to patch libtool.m4 in each and every
> package around? libtool.m4 from sdl is from libtool 2.2 which is not
> _that_ old (by the standards of libtool upgrade speed, of course), so
> we're likely to find many other packages in the same situation, aren't
> we?

 Let me rephrase this.

 You should actually update support/libtool/buildroot-libtool-v1.5.patch and
support/libtool/buildroot-libtool-v2.2.patch which will fix all packages in one
fell swoop. (That is, assuming that v2.4 is OK already.)

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
