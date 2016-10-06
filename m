From: Jerry Van Baren <gvb.buildroot@unssw.com>
Date: Thu, 6 Oct 2016 17:02:42 -0400
Subject: [Buildroot] [PATCH] Fix dhcp symlink in target/var/lib/dhcp
In-Reply-To: <b0e5ec54-e6e5-d088-ffbb-954ee738fea3@mind.be>
References: <CAK-g76X-fwsZnfmQaDN8a90kLrJCRfduAgNYyXuYa-UytHSfpA@mail.gmail.com>
 <25c03ce6-8771-cd39-32ef-b815ede292f6@mind.be>
 <CAK-g76Vp+TepJFwXN-RpFqWmr6nKUwVaHjUm0F8b5UDXXtE6Og@mail.gmail.com>
 <b0e5ec54-e6e5-d088-ffbb-954ee738fea3@mind.be>
Message-ID: <CAK-g76UT4rhxxf_B+ycapYb4QeVFFct7v+LH3WNqTp8GMQ2A4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[snip]

>  There is also an rsync of the BR2_ROOTFS_OVERLAY directories at the end of the
> build. Aha, that is probably what happens: you have a var/lib/dhcp/dhcpd.leases
> in you overlay!

BINGO! I missed that.

Thanks!
gvb
