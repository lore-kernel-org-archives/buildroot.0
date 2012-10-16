From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Oct 2012 19:41:17 +0200
Subject: [Buildroot] BuildRoot not starting with Udev
In-Reply-To: <loom.20121015T104727-737@post.gmane.org>
References: <loom.20121015T104727-737@post.gmane.org>
Message-ID: <20121016194117.2ed3a609@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Antoine Caurier,

On Mon, 15 Oct 2012 08:55:00 +0000 (UTC), Antoine Caurier wrote:

> Any ideas on what can causes my trouble?

Are letting Buildroot build your kernel, or are you building your
kernel outside of Buildroot? If you're building the kernel outside of
Buildroot, make sure that you have CONFIG_DEVTMPFS and
CONFIG_DEVTMPFS_MOUNT enabled in your kernel configuration/

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
