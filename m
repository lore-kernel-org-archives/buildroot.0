From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:35:41 +0200
Subject: [Buildroot] [Buildroot} [PATCH] Remove qt5base explicitlib patch
In-Reply-To: <20160906192831.67fde478@gmx.net>
References: <CAAcXeukkVNMK3E21M_aZMEc2m5nCmC75e1co2acWdmN=7QtUCg@mail.gmail.com>
 <20160906192831.67fde478@gmx.net>
Message-ID: <20160906213541.39feefc1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 6 Sep 2016 19:28:31 +0200, Peter Seiderer wrote:

> I think something went wrong with your update to latest master because
> the patch 'package/qt5/qt5base/0007-build-with-explicitlib-after-all.patch'
> was already removed as part of the version bump to 5.6.1-1, see commit
> 'qt5: bump version to 5.6.1-1' ([1])...

I confirm: qt5base patches apply just fine here:

>>> qt5base 5.6.1-1 Extracting
xzcat /home/thomas/dl/qtbase-opensource-src-5.6.1-1.tar.xz | tar --strip-components=1 -C /home/thomas/projets/buildroot/output/build/qt5base-5.6.1-1   -xf -
>>> qt5base 5.6.1-1 Patching

Applying 0006-eglfs-rasp-pi-header-inclusion.patch using patch: 
patching file config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
patching file src/plugins/platforms/eglfs/eglfs-plugin.pro
Hunk #1 succeeded at 1 with fuzz 1 (offset -5 lines).

Applying 0007-Remove-libudev-dependency-from-kms.pro.patch using patch: 
patching file config.tests/qpa/kms/kms.pro

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
