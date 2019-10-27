From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Oct 2019 00:46:22 +0100
Subject: [Buildroot] [PATCH vX 2/5] package/sysrepo: add package
In-Reply-To: <CAEyMn7b05n6AGMBqH7uVH+ahjG4VLopvX0zeAv9+jjm64_0-NQ@mail.gmail.com>
References: <20191024074644.10442-1-heiko.thiery@gmail.com>
 <20191024074644.10442-3-heiko.thiery@gmail.com>
 <20191025232307.4ca9357e@windsurf.home>
 <CAEyMn7b05n6AGMBqH7uVH+ahjG4VLopvX0zeAv9+jjm64_0-NQ@mail.gmail.com>
Message-ID: <be16a17d-24d1-dc13-b104-3afa5a56393e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/10/2019 07:17, Heiko Thiery wrote:
>> I gave this a try, but unfortunately, host-sysrepo causes an
>> installation failure here.
>>
>> I'm building this configuration:
>>
>> BR2_arm=y
>> BR2_TOOLCHAIN_EXTERNAL=y
>> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
>> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2019.05.1.tar.bz2"
>> BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
>> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
>> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
>> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
>> BR2_TOOLCHAIN_EXTERNAL_CXX=y
>> BR2_INIT_NONE=y
>> BR2_SYSTEM_BIN_SH_NONE=y
>> # BR2_PACKAGE_BUSYBOX is not set
>> BR2_PACKAGE_SYSREPO=y
>> # BR2_TARGET_ROOTFS_TAR is not set
> 
> Can you give me a hint how I can easily use this defconfig to
> reproduce this? I just used the test-pkg utility and this seems to
> build successfully and I struggle with setting this up.

 Just write those lines (and nothing else) to .config, remove the output
directory, and to make olddefconfig; make.

 Regards,
 Arnout
