From: lemonoje <lemonoje@gmail.com>
Date: Fri, 12 May 2017 07:16:00 -0700 (PDT)
Subject: [Buildroot] Altera SoC Buildroot external toolchain
	incompatible error
In-Reply-To: <20170512155205.526ea00c@free-electrons.com>
References: <1494532269551-164744.post@n4.nabble.com>
 <20170511221419.1e5e9baf@free-electrons.com>
 <1494533969065-164751.post@n4.nabble.com>
 <20170511225147.7466e9ff@free-electrons.com>
 <1494535599131-164758.post@n4.nabble.com>
 <20170511232316.693f8e6c@free-electrons.com>
 <1494594693346-164814.post@n4.nabble.com>
 <20170512155205.526ea00c@free-electrons.com>
Message-ID: <1494598560669-164820.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Okay, all of that is understood - thank you for further clarification. 
However, no matter which method I choose (BR download + extract, or point to
my toolchain) - I still get the same error:

*>>> toolchain-external-linaro-arm 2016.11 Installing to staging directory
/usr/bin/install -D -m 0755
/sf/ArriaX/ltsi_4_1_33/buildroot/output/build/toolchain-external-linaro-arm-2016.11/toolchain-wrapper
/sf/ArriaX/ltsi_4_1_33/buildroot/output/host/usr/bin/toolchain-wrapper
ln: failed to create symbolic link
?/sf/ArriaX/ltsi_4_1_33/buildroot/output/host/usr/ARM-buildroot-linux-gnueabihf/sysroot/usr/lib?:
No such file or directory
package/pkg-generic.mk:255: recipe for target
'/sf/ArriaX/ltsi_4_1_33/buildroot/output/build/toolchain-external-linaro-arm-2016.11/.stamp_staging_installed'
failed
make: ***
[/sf/ArriaX/ltsi_4_1_33/buildroot/output/build/toolchain-external-linaro-arm-2016.11/.stamp_staging_installed]
Error 1
make: Leaving directory '/sf/ArriaX/ltsi_4_1_33/buildroot'*

Maybe I should save my config, delete the BR directory, re-clone and
checkout, and try again?




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Altera-SoC-Buildroot-external-toolchain-incompatible-error-tp164744p164820.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
