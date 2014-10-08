From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Oct 2014 22:52:29 +0200
Subject: [Buildroot] [PATCH] botan: add type to
	BR2_PACKAGE_BOTAN_ARCH_SUPPORTS option
In-Reply-To: <1412798411-18889-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 8 Oct 2014 22:00:11 +0200")
References: <1412798411-18889-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878ukqb7xu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Commit 1737af367993326ee47e847bd755806c8a78ced8 ('botan: limit to
 > supported CPU architectures') introduced the
 > BR2_PACKAGE_BOTAN_ARCH_SUPPORTS with a default value, but forgot to
 > define a type, which leads to a kconfig warning:

 >   package/botan/Config.in:1:warning: config symbol defined without type

 > This commit fixes that by properly setting the type.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
