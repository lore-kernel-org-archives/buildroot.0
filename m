From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 4 Dec 2017 12:23:21 +0100
Subject: [Buildroot] [PATCH 1/2] android-tools: Enable build for ext4
 fsutils
In-Reply-To: <CAHjoi4fMAY3B7kOBfUQ1VNknR27ks-RU+nYGhy3+w609kA+s+w@mail.gmail.com>
References: <20171130205631.93251-1-ek9852@gmail.com>
 <20171201124924.ajmy3ibrnlznfddb@t450s.lan>
 <CAHjoi4fMAY3B7kOBfUQ1VNknR27ks-RU+nYGhy3+w609kA+s+w@mail.gmail.com>
Message-ID: <20171204112321.mte4qbqtgffu7sjf@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Keith,

On Fri, Dec 01, 2017 at 10:25:05PM -0800, Keith Mok wrote:
> Basically depends on BR2_PACKAGE_LIBSELINUX.
> But BR2_PACKAGE_LIBSELINUX depends on BR2_TOOLCHAIN_HAS_THREADS
> BR2_STATIC_LIBS BR2_TOOLCHAIN_USES_GLIBC BR2_arc
> Those dependency are just copied from FASTBOOT.

Yes the 'depends' are ok, no problem there, but a 'comment' section is
missing. See under the fastboot 'config' section [1].

Regards,
Gary

[1] https://git.buildroot.net/buildroot/tree/package/android-tools/Config.in#n49
