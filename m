From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 27 Oct 2014 18:14:24 +0100
Subject: [Buildroot] [PATCH] dhcp: add systemd service file
In-Reply-To: <20141026221307.60bc5ffa@free-electrons.com>
References: <1410815083-11776-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20141026221307.60bc5ffa@free-electrons.com>
Message-ID: <20141027171424.GC24636@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Sun, Oct 26, 2014 at 10:13:07PM +0100, Thomas Petazzoni wrote:
> Dear Eric Le Bihan,
>
> On Mon, 15 Sep 2014 23:04:43 +0200, Eric Le Bihan wrote:
> > Add a systemd service file to start dhcpd.
> >
> > The network interfaces to listen on can be set via the variable
> > INTERFACES in /etc/default/dhcpd.conf. Example:
> >
> >   INTERFACES="eth0 eth1"
> >
> > Also install a tmpfiles.d file to create /var/lib/dhcp/dhcpd.leases
> > (needed at dhcpd start-up).
> >
> > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > ---
> >  package/dhcp/dhcp.mk       | 15 +++++++++++++++
> >  package/dhcp/dhcpd.service | 13 +++++++++++++
> >  2 files changed, 28 insertions(+)
> >  create mode 100644 package/dhcp/dhcpd.service
>
> What is the status of this patch? Yann made some comments, which
> apparently you agreed on. Is a new version of the patch needed?

As explained in my reply to Yann, there is no need for a new version of the
patch.

Best regards
ELB
