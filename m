From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 30 Aug 2020 00:57:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/hiredis: bump to version 1.0.0
In-Reply-To: <20200830001347.3c9e2bf3@windsurf.home>
References: <20200829213916.2909668-1-fontaine.fabrice@gmail.com>
 <20200830001347.3c9e2bf3@windsurf.home>
Message-ID: <CAPi7W81K8AoaCdXTnhG_aEBSzYvjt2EXwRX_3b1-QnWsLAz3cg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dim. 30 ao?t 2020 ? 00:13, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Sat, 29 Aug 2020 23:39:16 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > - Use cmake which is available since version 1.0.0 and
> >   https://github.com/redis/hiredis/commit/ead586a2cb7de8a17073a96704a4200d63a380e5
> > - Disable tests
> > - Add openssl optional dependency
> >
> > https://github.com/redis/hiredis/blob/v1.0.0/CHANGELOG.md
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Thanks Fabrice. Quick question: did you test a bit of the reverse
> dependencies of hiredis were still building fine after this update ?
Yes, suricata, collectd and proftpd build fine.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
