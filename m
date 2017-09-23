From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Sep 2017 22:24:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/mdadm: not available in static
 builds
In-Reply-To: <20170904044954.31001-1-bernd.kuhls@t-online.de>
References: <20170904044954.31001-1-bernd.kuhls@t-online.de>
Message-ID: <30cc0536-8d24-a218-a45e-f1632c015a74@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-09-17 06:49, Bernd Kuhls wrote:
> http://git.neil.brown.name/?p=mdadm.git;a=commitdiff;h=7716570e6d906e7326f83d466f6ba73009649d03#patch9
> added code to include dlfcn.h.
> 
> Fixes
> http://autobuild.buildroot.net/results/163/163ad5a9f976662be8ca8664f91254f90fca8439/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>


 Applied to master, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
