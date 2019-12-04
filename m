From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Dec 2019 16:18:08 +0100
Subject: [Buildroot] Autobuilder Package Stats Page
In-Reply-To: <2139527.4b9fbVHFrc@laptop>
References: <1653501.gvH1ob0Lqs@laptop> <20191204155348.39878299@windsurf>
 <2139527.4b9fbVHFrc@laptop>
Message-ID: <20191204161808.077370d9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 04 Dec 2019 15:12:50 +0000
Mark Corbin <mark@dibsco.co.uk> wrote:

> > When a "next" branch exists, the page is based on data from the next
> > branch, so that we use the latest package versions known by Buildroot.
> > However, all your URL-related changes have been merged to master, so
> > they didn't show up in the refreshed statistics page.  
> 
> Do any changes made to 'master' normally get committed to 'next' too when it 
> exists?

No. We only merge "next" back into "master" just after the release. We
sometimes do cherry-pick some patches from master into next if they fix
some build issues that affect the autobuilders on both the master and
next branch, but for all other changes, we wait until next is merged
back until master.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
