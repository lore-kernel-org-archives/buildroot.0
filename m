From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:22:14 +0200
Subject: [Buildroot] [PATCH v2 1/3] postgresql: add replacement pg_config
In-Reply-To: <20140817212038.2b7879ca@free-electrons.com>
References: <1407938231-22544-1-git-send-email-bos@je-eigen-domein.nl>
 <20140817212038.2b7879ca@free-electrons.com>
Message-ID: <20140817212214.6744d57f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Aug 2014 21:20:38 +0200, Thomas Petazzoni wrote:
> Dear Floris Bos,
> 
> On Wed, 13 Aug 2014 15:57:09 +0200, Floris Bos wrote:
> > Normally pg_config is a native application compiled for the
> > target architecture. Since we cannot execute those on the
> > host system, provide a simple shell script as replacement.
> > 
> > Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> > ---
> >  package/postgresql/pg_config     | 19 +++++++++++++++++++
> >  package/postgresql/postgresql.mk |  8 ++++++++
> >  2 files changed, 27 insertions(+)
> >  create mode 100644 package/postgresql/pg_config
> 
> Applied, thanks.

Sorry forgot to mention this: I applied this to the next branch, not
the master branch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
