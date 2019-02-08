From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 8 Feb 2019 08:54:50 +0100
Subject: [Buildroot] git tarball hashes [was: Report of Buildroot
 developer meeting FOSDEM 2019]
In-Reply-To: <78472b2d-4adc-b110-273e-ddce78316dc2@mind.be>
References: <bc55cb82-c939-78c9-30ee-8c02c39fe425@mind.be>
 <78472b2d-4adc-b110-273e-ddce78316dc2@mind.be>
Message-ID: <20190208085450.6306509e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 7 Feb 2019 23:55:24 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> On 07/02/2019 23:51, Arnout Vandecappelle wrote:
> > making sure the git backend
> > produces reproducible tarballs by using the pax archive format (Yann started
> > working on an implementation for that)  
> 
> ?I realized while writing this: how does this approach fix the instability of
> gzip? Or do we assume that that was a one-off?

Which gzip issue are you talking about ? I think we never had a
*version* issue with gzip, only with installations where gzip is a
symlink to pigz.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
