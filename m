From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 13 Jan 2015 20:56:56 +0100
Subject: [Buildroot] Fwd: Fwd: Fwd: Fwd: [PATCH v3] linux: add fbtft
 kernel extension
Message-ID: <trinity-ab46314b-f09d-4688-8d36-40aa9b9e650b-1421179016806@3capp-gmx-bs51>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Lou,

On Mon, Jan 12, 2015 at 05:33:12PM -0600, Lou Crittenden wrote:
> here's the output of the patch job:
> 
> lou at lou:~/tmp/buildroot-2014.11$ patch -p 1 < '/home/lou/ads7846.patch'
> patching file linux/linux.mk
> Hunk #1 succeeded at 194 (offset -2 lines).
> patching file package/Config.in
> Hunk #1 succeeded at 284 (offset -2 lines).
> patching file package/ads7846-device/Config.in
> patching file package/ads7846-device/ads7846-device.mk
> 
> 
> Were these the files you want to patch?

Yes, now you have to enable the buildroot option 'BR2_PACKAGE_ADS7846_DEVICE'
and start a buildroot build (best complete rebuild, second best force
a rebuild of the linux kernel and modules)...

After this you should have a ads7846.ko module and an ads7846_device.ko module...

Regards,
Peter
