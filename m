From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 22:51:47 +0200
Subject: [Buildroot] Altera SoC Buildroot external toolchain
 incompatible error
In-Reply-To: <1494533969065-164751.post@n4.nabble.com>
References: <1494532269551-164744.post@n4.nabble.com>
 <20170511221419.1e5e9baf@free-electrons.com>
 <1494533969065-164751.post@n4.nabble.com>
Message-ID: <20170511225147.7466e9ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 May 2017 13:19:29 -0700 (PDT), lemonoje wrote:

> Wow - thanks for the quick reply.  I am using the make ... ...  nconfig menu
> utility.  Under Target EABI--->, I had no option for EABIhf, but now I just
> selected *"Enable VFP extension support"* which then gives me the Target
> ABI--->EABIhf.  I should have my C library as glibc, correct?  

It depends what your toolchain is.

> >>> toolchain-external  Installing to staging directory  
> /usr/bin/install -D -m 0755
> /sf/ArriaX/ltsi_4_1_33/buildroot/output/build/toolchain-external/toolchain-wrapper
> /sf/ArriaX/ltsi_4_1_33/buildroot/output/host/usr/bin/toolchain-wrapper
> ln: failed to create symbolic link
> ?/sf/ArriaX/ltsi_4_1_33/buildroot/output/host/usr/ARM-buildroot-linux-gnueabihf/sysroot/usr/lib?:
> No such file or directory
> package/pkg-generic.mk:255: recipe for target
> '/sf/ArriaX/ltsi_4_1_33/buildroot/output/build/toolchain-external/.stamp_staging_installed'
> failed
> 
> I do not have the 'usr' path under  ^^^ path/sysroot

Is your external toolchain available somewhere so that I can try to
reproduce?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
