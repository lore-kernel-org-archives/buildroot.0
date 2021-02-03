From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Feb 2021 18:49:38 +0100
Subject: [Buildroot] [PATCH] package/xenomai: set 'custom' as version in
 case of tarball
In-Reply-To: <20210131212741.16880-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Sun, 31 Jan 2021 22:27:40 +0100")
References: <20210131212741.16880-1-patrickdepinguin@gmail.com>
Message-ID: <87ft2dghxp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > When BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL is selected, the xenomai package
 > declared an empty version, which among others means that the build directory
 > becomes output/build/xenomai without any version specification, and empty
 > version information in 'xenomai-show-info'.

 > Other packages that allow a custom tarball, like 'linux' and
 > 'arm-trusted-firmware', specify 'custom' as version in this case.

 > Adapt the xenomai package accordingly.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
