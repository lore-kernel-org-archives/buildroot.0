From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2020 21:10:45 +0100
Subject: [Buildroot] [PATCH] package/lvm2: install udev rules
In-Reply-To: <20200102152645.9994-1-p.debruijn@unilogic.nl> (Pascal de
 Bruijn's message of "Thu, 2 Jan 2020 16:26:45 +0100")
References: <20200102152645.9994-1-p.debruijn@unilogic.nl>
Message-ID: <8736cnkr7e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Pascal" == Pascal de Bruijn <p.debruijn@unilogic.nl> writes:

 > Without the device-mapper udev rules, dm devices will not get a proper
 > symlink like /dev/disk/by-label/LABEL, which in turn causes fstab
 > LABEL= mounts to fails.

 > And by extension causes shenanigans with systemd, where it will
 > unmount a manually mounted disk because it can't resolve the label.

 > Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
