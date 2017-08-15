From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Aug 2017 10:40:48 +0200
Subject: [Buildroot] [PATCH 3/3] whois: bump to version 5.2.17
In-Reply-To: <20170815041832.jyuew657zabwrplz@sapphire.tkos.co.il>
References: <37040459db3e6ca01e2dc8236cf57a993f1831ed.1502649259.git.baruch@tkos.co.il>
 <b5c9e26c4b8e652827b9d04dad2f821a329c3249.1502649259.git.baruch@tkos.co.il>
 <20170815041832.jyuew657zabwrplz@sapphire.tkos.co.il>
Message-ID: <20170815104048.28e8d41f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Aug 2017 07:18:32 +0300, Baruch Siach wrote:

> On Sun, Aug 13, 2017 at 09:34:19PM +0300, Baruch Siach wrote:
> > Fixes serious usability issues (Debian changelog):
> > 
> >   * Fixed whois referrals for .com, .net, .jobs, .bz, .cc and .tv,
> >     broken by an ICANN-mandated output change:
> >     https://www.icann.org/resources/pages/rdds-labeling-policy-2017-02-01-en
> > 
> > Use snapshot.debian.org for the .dsc reference, since files tend to
> > disappear from the official Debian ftp site over time.
> > 
> > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>  
> 
> Why has this patch been marked 'Changes Requested'? It is independent of other 
> patches in this series.

Because I always mark all patches in a series as Changes Requested if
at least one of them had comments. Indeed, if it's a patch series, we
expect the submitter to resend a complete new iteration of the series,
even if some patches remain unchanged.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
