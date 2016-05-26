From: daggs <daggs@gmx.com>
Date: Thu, 26 May 2016 08:05:18 +0200
Subject: [Buildroot] [PATCH v2 resend 3/3] - allow building of odroid
 mali GL libs when using defconfig. - add S50display which sets the odroid
 mali fb.
In-Reply-To: <20160525223707.203198b1@itchy>
References: <20160525174921.7217-1-daggs@gmx.com>,
 <20160525223707.203198b1@itchy>
Message-ID: <trinity-64a924f5-be62-4d20-ab65-b4f0f1ec63f3-1464242718878@3capp-mailcom-bs10>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

> Sent: Wednesday, May 25, 2016 at 11:37 PM
> From: "Eric Le Bihan" <eric.le.bihan.dev@free.fr>
> To: Dagg <daggs@gmx.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH v2 resend 3/3] - allow building of odroid mali GL libs when using defconfig. - add S50display which sets the odroid mali fb.
>
> Hi!
> 
> Le Wed, 25 May 2016 20:49:21 +0300,
> Dagg <daggs@gmx.com> a ?crit :
> 
> >  .../odroidc2/fs-overlay/etc/init.d/S50display      | 103
> > +++++++++++++++++++++
> > configs/odroidc2_defconfig                         |   1 + 2 files
> > changed, 104 insertions(+) create mode 100644
> > board/hardkernel/odroidc2/fs-overlay/etc/init.d/S50display
> > 
> > diff --git
> > a/board/hardkernel/odroidc2/fs-overlay/etc/init.d/S50display
> > b/board/hardkernel/odroidc2/fs-overlay/etc/init.d/S50display new file
> > mode 100644 index 0000000..68f8c6c --- /dev/null
> > +++ b/board/hardkernel/odroidc2/fs-overlay/etc/init.d/S50display
> > @@ -0,0 +1,103 @@
> 
> Would it be possible to extract the functions from the S50display
> service to an external script (e.g. 
> board/hardkernel/odroidc2/fs-overlay/usr/sbin/setup-fb) and have
> the service call it? This would allow reusing it with another init system
> (namely systemd).
> 
> Thanks.
> 
> -- 
> ELB

it can be done easily, but as adjusting the code to work with systemd isn't high on my todo list, I'll not be doing it now.
my apologies.

Dagg.
