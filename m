From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 22:05:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: fix static build
 with lts-musl
In-Reply-To: <20191017074324.GA21117@dell5510>
References: <20191014165335.4884-1-fontaine.fabrice@gmail.com>
 <20191014224947.258f834d@windsurf.home>
 <20191016222624.GA20069@dell5510>
 <20191017090518.27cbbe11@windsurf>
 <20191017074324.GA21117@dell5510>
Message-ID: <20191021220545.5aa02c3f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 17 Oct 2019 09:43:25 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> > LDLIBS := -lcpu_set -lcontrollers -lltp $(LDLIBS)  
> We already use LDLIBS := -lfoo -lbar $(LDLIBS) approach in some Makefiles,
> IMHO we could fix it for static build.

Thanks for confirming. So I'll mark this patch as Changes Requested,
waiting for the recommended approach to be submitted.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
