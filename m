From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Sep 2019 20:31:45 +0200
Subject: [Buildroot] [PATCH] package/bc: bump to 1.07.1
In-Reply-To: <CANQCQpY_HqqxoUkAOcxN0_ORRnYLTdUdfBXC=5ZfShXOWCDeCg@mail.gmail.com>
References: <20190912205057.40777-1-matthew.weber@rockwellcollins.com>
 <20190913194622.303b5a31@windsurf.home>
 <CANQCQpY_HqqxoUkAOcxN0_ORRnYLTdUdfBXC=5ZfShXOWCDeCg@mail.gmail.com>
Message-ID: <20190913203145.2e05eb85@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Fri, 13 Sep 2019 13:14:10 -0500
Matthew Weber <matthew.weber@collins.com> wrote:

> For the patches that were kept in this bump, they were all still
> pending and on the debian / yocto distro patch lists.   I wasn't able
> to find any upstream submissions.  Are patches against gnu tools like
> bc done directly to the maintainer ( Phil Nelson
> <philnelson@acm.org>)?  I could definitely send them out to him if
> that makes sense.

Yes, I already contributed a patch to bc a while ago, and indeed, I
sent it directly to the upstream author. Interestingly, the patch and
discussion I had were precisely about libmath being re-generated, and
that was last year.

He had sent me some test versions of bc 1.07.2 which should have fixed
the problem, but I never took the time to reply it seems :-/

These projects with no mailing list, bug tracker or public version
control system are really difficult to work with :-/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
