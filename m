From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 May 2019 22:43:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/suricata: needs autoreconf
In-Reply-To: <20190528224332.0dcf7f56@windsurf.home>
References: <20190528171530.15382-1-fontaine.fabrice@gmail.com>
 <20190528224332.0dcf7f56@windsurf.home>
Message-ID: <20190528224355.443564f7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 28 May 2019 22:43:32 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Tue, 28 May 2019 19:15:30 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
> > Commit 1ce2db1090c494f57019af4f29691e0f86b48330 was the second patch of
> > a third patch serie, it was applied without the first one so
> > AUTORECONF=YES was missing and patch number was wrong. Fix these two
> > errors.
> > 
> > Fixes:
> >  - http://autobuild.buildroot.org/results/a26d3493399c43faa37d2d67d772e0833971a9de
> > 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  ...patch => 0001-configure.ac-fix-static-build-with-pcap.patch} | 0
> >  package/suricata/suricata.mk                                    | 2 ++
> >  2 files changed, 2 insertions(+)
> >  rename package/suricata/{0002-configure.ac-fix-static-build-with-pcap.patch => 0001-configure.ac-fix-static-build-with-pcap.patch} (100%)  
> 
> Applied to next, thanks.

Gaah, wrong key shortcut: I applied to master, of course.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
