From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jan 2018 09:10:44 +0100
Subject: [Buildroot] patchwork.ozlabs.org down, and e-mails not recorded
In-Reply-To: <ced2aeb2-82f6-c836-dd5a-e65c6b49c81a@au1.ibm.com>
References: <20180105214340.6f0cc1f7@windsurf>
 <ced2aeb2-82f6-c836-dd5a-e65c6b49c81a@au1.ibm.com>
Message-ID: <20180108091044.1141f540@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 8 Jan 2018 10:33:21 +1100, Andrew Donnellan wrote:

> > Also, since a few weeks, we have seen that patchwork misses some
> > patches that are sent on the Buildroot mailing list. The mails are sent
> > on the mailing list, they are in the mailing list archives, but
> > patchwork does not record them.
> > 
> > An example is:
> > 
> >    http://lists.busybox.net/pipermail/buildroot/2017-December/209885.html
> > 
> > PATCH 3/3 was not recorded by patchwork, while other patches in the
> > series have been.  
> 
> Hmm, looking at the patch list, I also see that patch 2/3 in that series 
> (https://patchwork.ozlabs.org/patch/852063/) wasn't correctly identified 
> in the same series as patch 1 
> (https://patchwork.ozlabs.org/patch/852062/) which is a bit weird.

Note: this issue happened again yesterday. In this series of 4 patches:

  http://lists.busybox.net/pipermail/buildroot/2018-January/210935.html

Only patches 2/4 and 4/4 have been recorded by patchwork:

  https://patchwork.ozlabs.org/patch/856422/
  https://patchwork.ozlabs.org/patch/856423/

Even though all 4 patches have been received through the mailing list.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
