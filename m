From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Nov 2020 14:56:01 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-11-29
In-Reply-To: <J1YLKQ.P3QKQKT3GHRM@crapouillou.net>
References: <J1YLKQ.P3QKQKT3GHRM@crapouillou.net>
Message-ID: <20201130145601.153277dc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Nov 2020 11:46:31 +0000
Paul Cercueil <paul@crapouillou.net> wrote:

> > Packages with CVEs
> > ==================
> > 
> > This is the list of packages for which a known CVE is affecting
> > them, which means a security vulnerability exists for
> > those packages.
> > 
> >              name              |       CVE        |                   
> >           link
> > -------------------------------+------------------+--------------------------------------------------------------
> >                      lightning | CVE-2020-7747    | 
> > https://security-tracker.debian.org/tracker/CVE-2020-7747  
> 
> The CVE is for lightning-server (whatever that is), while the 
> "lightning" package is for GNU Lightning which is a JIT library.

Thanks for the report. This is precisely what the recently merged CPE
ID matching series allows to solve: make sure we can associate to each
package the correct CPE ID, so that CVEs are not just matched based on
the package name.

The initial steps of this have been merged in the next branch last
week. I have 3 remaining patches in this series that I need to respin.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
