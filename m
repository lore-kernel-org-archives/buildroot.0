From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 21 Oct 2019 22:21:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: fix static build
 with lts-musl
In-Reply-To: <20191021220545.5aa02c3f@windsurf>
References: <20191014165335.4884-1-fontaine.fabrice@gmail.com>
 <20191014224947.258f834d@windsurf.home>
 <20191016222624.GA20069@dell5510>
 <20191017090518.27cbbe11@windsurf>
 <20191017074324.GA21117@dell5510>
 <20191021220545.5aa02c3f@windsurf>
Message-ID: <20191021202117.GA6130@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Fabrice,

> On Thu, 17 Oct 2019 09:43:25 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:

> > > LDLIBS := -lcpu_set -lcontrollers -lltp $(LDLIBS)  
> > We already use LDLIBS := -lfoo -lbar $(LDLIBS) approach in some Makefiles,
> > IMHO we could fix it for static build.

> Thanks for confirming. So I'll mark this patch as Changes Requested,
> waiting for the recommended approach to be submitted.
Thanks for your patience, I have it on my todo list.

> Thanks!

> Thomas

Kind regards,
Petr
