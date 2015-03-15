From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2015 23:54:56 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/softether: Fix iconv-related
	compile error
In-Reply-To: <20150315125324.39a11265@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 15 Mar 2015 12:53:24 +0100")
References: <1426408159-24817-1-git-send-email-bernd.kuhls@t-online.de>
 <20150315125324.39a11265@free-electrons.com>
Message-ID: <874mplg9bz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Bernd Kuhls,
 > On Sun, 15 Mar 2015 09:29:19 +0100, Bernd Kuhls wrote:

 >> BR2_arm=y
 >> BR2_arm1176jzf_s=y
 >> BR2_COMPILER_PARANOID_UNSAFE_PATH=y
 >> BR2_TOOLCHAIN_EXTERNAL=y
 >> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 >> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
 >> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv6-ctng-linux-uclibcgnueabi.tar.xz"
 >> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="armv6-ctng-linux-uclibcgnueabi"
 >> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_9=y
 >> BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
 >> BR2_TOOLCHAIN_EXTERNAL_WCHAR=y
 >> BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
 >> BR2_TOOLCHAIN_EXTERNAL_CXX=y
 >> BR2_PACKAGE_SOFTETHER=y

 > I tried to build this defconfig, and the build went fine here. Tested
 > at commit d4f7cfe1855cefa35322891e887636c3b82a6aea, full config at
 > http://code.bulix.org/u9uhwi-88083?raw, log file at
 > http://code.bulix.org/5wyyws-88084?raw.

 > Indeed, the LIBS += handling is fixed by your patch, but I'm wondering
 > why I'm not seeing the problem.

I'm not sure either. As I mentioned earlier, I am also not able to
reproduce the issue.

-- 
Bye, Peter Korsgaard
