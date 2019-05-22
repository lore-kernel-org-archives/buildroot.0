From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 22 May 2019 09:05:34 -0500
Subject: [Buildroot] [PATCH v4 1/1] package/iputils: bump to version
 s20190515
In-Reply-To: <20190520205637.7018d95b@windsurf.home>
References: <20190519211504.15141-1-petr.vorel@gmail.com>
 <20190520205637.7018d95b@windsurf.home>
Message-ID: <CANQCQpZi6Oy+bt+Y4OpCnECCNfEtYEtJyK=-t6w90HepbgpBnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr,


On Mon, May 20, 2019 at 1:56 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sun, 19 May 2019 23:15:04 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:
>
> > This commit also include changes from s20190324.
> >
> > Upstream changed build system to Meson, these extra changes
> > were required:
> > * remove custom commands of previous build system:
> > (IPUTILS_INSTALL_TARGET_CMDS, IPUTILS_PERMISSIONS)
> > * remove USE_SYSFS=no (support removed from upstream
> > * transform options from USE_FOO={yes,no} to -DUSE_FOO={true,false}
> >
> > Removed patch included in this release
> >
> > Build ninfod if possible (when use any crypto)
> >
> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Would you mind taking a look at a build failure from this patch?
http://autobuild.buildroot.net/results/f78ac0d3c9a679a584bd54ac7f908390f5a4087b/

> > ---
> > Changes v3->v4:
> > * fixed build on systems without Docbook Stylesheets
>
> Applied to next, thanks.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 

Matthew Weber | Pr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
