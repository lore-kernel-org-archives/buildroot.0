From: Steve Calfee <nospamcalfee@yahoo.com>
Date: Fri, 6 Feb 2009 17:09:38 -0800 (PST)
Subject: [Buildroot] 2009.02-rc3 released
In-Reply-To: <388709.89503.qm@web58208.mail.re3.yahoo.com>
Message-ID: <13244.97903.qm@web58207.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After successfully building, I tried to run the built image in vmware. I found out that the kernel was not built.

I used "make menuconfig" and just exited and then "make"

What do I need to do to get the kernel built? Is there a generic x86 defconfig? If I go to the kernel (in toolchain_build_i386/linux....) and run its menuconfig, the build breaks because I need to set a path for buildroot?

Thanks, Steve


      
