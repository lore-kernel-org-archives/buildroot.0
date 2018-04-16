From: AAlex_ <earthquake.de@freenet.de>
Date: Mon, 16 Apr 2018 05:17:42 -0700 (MST)
Subject: [Buildroot] makedev capabilities support - capablities lost after
 booting the image
Message-ID: <1523881062231-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
setting the cappabilities of an executable via BR2_ROOT_FS_DEVICE_TABLE as
descripted in [9.5.1. Setting file permissions and ownership and adding
custom devices nodes] fails.
When capabilities specified to an file they are set in the disk image, means
if i mount the disk image file and check via getcap it get the excpected
capabilities. 
But if the builroot system boots, the capablities are lost.
Is there another lib/flag? The buildroot system supports capabilities
because I set it via an startscript within buildroot system, but this is not
longer possible because I want to swtich to read only root_fs. This is the
reason I want to set the capablilities via device_table.

Regards,
Alex



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
