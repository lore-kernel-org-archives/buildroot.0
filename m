From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 1 Mar 2020 21:22:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/ed: annotate CVE-2015-2987
In-Reply-To: <20200301210210.47c0425f@windsurf.home>
References: <20200301194637.210308-1-fontaine.fabrice@gmail.com>
 <20200301210210.47c0425f@windsurf.home>
Message-ID: <CAPi7W81jP0_KB5F2noMEKS2urNTxZOdN-nw79nffBYg4S5C4Wg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dim. 1 mars 2020 ? 21:02, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Sun,  1 Mar 2020 20:46:37 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > CVE-2015-2987 is misclassified (by our CVE tracker) as affecting ed,
> > while in fact it affects Type74 ED (http://type74.org/edman5-1.php).
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Same comment as for smack and argus: we need to add a CPE ID mapping
> mechanism, and not add these IGNORE_CVES entries.
OK, then I'll stop sending patches for those kind of issues ;-)
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
