From: lemonoje <lemonoje@gmail.com>
Date: Thu, 11 May 2017 13:19:29 -0700 (PDT)
Subject: [Buildroot] Altera SoC Buildroot external toolchain
	incompatible error
In-Reply-To: <20170511221419.1e5e9baf@free-electrons.com>
References: <1494532269551-164744.post@n4.nabble.com>
 <20170511221419.1e5e9baf@free-electrons.com>
Message-ID: <1494533969065-164751.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
Wow - thanks for the quick reply.  I am using the make ... ...  nconfig menu
utility.  Under Target EABI--->, I had no option for EABIhf, but now I just
selected *"Enable VFP extension support"* which then gives me the Target
ABI--->EABIhf.  I should have my C library as glibc, correct?  

I get a little further...now stalled at:

>>> toolchain-external  Installing to staging directory
/usr/bin/install -D -m 0755
/sf/ArriaX/ltsi_4_1_33/buildroot/output/build/toolchain-external/toolchain-wrapper
/sf/ArriaX/ltsi_4_1_33/buildroot/output/host/usr/bin/toolchain-wrapper
ln: failed to create symbolic link
?/sf/ArriaX/ltsi_4_1_33/buildroot/output/host/usr/ARM-buildroot-linux-gnueabihf/sysroot/usr/lib?:
No such file or directory
package/pkg-generic.mk:255: recipe for target
'/sf/ArriaX/ltsi_4_1_33/buildroot/output/build/toolchain-external/.stamp_staging_installed'
failed

I do not have the 'usr' path under  ^^^ path/sysroot




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Altera-SoC-Buildroot-external-toolchain-incompatible-error-tp164744p164751.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
