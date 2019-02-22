From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 22 Feb 2019 22:29:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/gdb: disable inprocess-agent in
 static build
In-Reply-To: <20190222222840.52cca2a7@windsurf>
References: <20190222095044.32559-1-fontaine.fabrice@gmail.com>
 <20190222222840.52cca2a7@windsurf>
Message-ID: <20190222222939.2598e35a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 22 Feb 2019 22:28:40 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Fri, 22 Feb 2019 10:50:44 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
> > Fixes:
> >  - http://autobuild.buildroot.org/results/b40bdbca6669a81301fca523e982dbc9584a4e65
> > 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/gdb/gdb.mk | 5 +++++
> >  1 file changed, 5 insertions(+)  
> 
> Applied to next, thanks.

Sorry: I applied to master.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
