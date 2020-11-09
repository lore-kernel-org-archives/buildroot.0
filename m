From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 9 Nov 2020 16:02:59 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-11-08
In-Reply-To: <20201109160031.3828bba8@windsurf.home>
References: <20201109135402.ddk3myxwpwf7mkey@falbala.internal.home.lespocky.de>
 <20201109160031.3828bba8@windsurf.home>
Message-ID: <CAPi7W8016gz+ci+uNNO_O5VzW2s6yUYEBnZkc5DTLOKxeo4M=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le lun. 9 nov. 2020 ? 16:00, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Mon, 9 Nov 2020 14:54:03 +0100
> Alexander Dahl <post@lespocky.de> wrote:
>
> > that vulnerability was fixed by Fabrice Fontaine
> > with 148058a46293 ("package/fastd: bump to version 21") for master and
> > with 7e4af3ce3f91 ("package/fastd: fix CVE-2020-27638") which got
> > cherry-picked for the stable branches.
> >
> > In the stable branches, there's a marker in FASTD_IGNORE_CVES in
> > package/fastd/fastd.mk which probably silences such warnings. But how
> > is this supposed to work if such vulnerabilities are closed via an
> > ordinary release like that v21 in case of fastd? Just adding all CVE
> > numbers to that variable could pile up a lot over time?
>
> CVE-2020-27638 should not be reported on v21 and later versions,
> because at https://nvd.nist.gov/vuln/detail/CVE-2020-27638, there is
> "Up to (excluding) 21.0".
>
> Are you seeing reports from Buildroot tooling where version v21 is said
> to be affected by this CVE ?
http://autobuild.buildroot.org/stats/ is reporting that fastd 21 is
affected by this CVE.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
