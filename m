From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Feb 2018 14:51:40 +0100
Subject: [Buildroot] [git commit branch/next] package/glibc: security
 bump to 2.27
In-Reply-To: <20180206125202.gdrli7t2g2bp4d3n@tarshish> (Baruch Siach's
 message of "Tue, 6 Feb 2018 14:52:02 +0200")
References: <20180206124246.13C0B884B3@busybox.osuosl.org>
 <20180206124536.GB28439@scaer>
 <20180206125202.gdrli7t2g2bp4d3n@tarshish>
Message-ID: <878tc6tedv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Yann,
 > On Tue, Feb 06, 2018 at 01:45:36PM +0100, Yann E. MORIN wrote:
 >> On 2018-02-06 13:41 +0100, Thomas Petazzoni spake thusly:
 >> > commit: https://git.buildroot.net/buildroot/commit/?id=c032e6825ad96e6d4b69cecde2402c02a2a356b5
 >> > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next
 >> 
 >> Subject says "security bump". Sorry, but this is not a security bump.
 >> This is a normal bump that happens to have security fixes.
 >> 
 >> Otherwise, almost any bump of almost any package is a security bump...

 > When we know that a package bump fixes a known security issue we usually note 
 > that in the subject line. Look for 'security' in commit subjects. You will 
 > find that many (most?) are just version bumps.

Indeed, this is in line with the other commits. It is somewhat sad that
glibc does not separate security fixes from feature releases, but that's
how it is.

-- 
Bye, Peter Korsgaard
