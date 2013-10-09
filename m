From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Oct 2013 15:25:38 +0200
Subject: [Buildroot] [PATCHv3 11/20] toolchain: do not check largefile,
	wchar, IPv6 and locale for glibc toolchains
In-Reply-To: <1381256237-27948-12-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 8 Oct 2013 20:17:08 +0200")
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-12-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k3hm37al.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The check_glibc function contained checks to verify that the user had
 Thomas> properly enabled the largefile, IPv6, locale and wchar options, to
 Thomas> match how glibc is configured. This was useful when the support for
 Thomas> glibc external toolchains was introduced, but since then, we added the
 Thomas> BR2_TOOLCHAIN_USES_GLIBC symbol that automatically enables largefile,
 Thomas> IPv6, locale and wchar support when a glibc or eglibc external
 Thomas> toolchain is used. Therefore, many of the check_glibc checks are
 Thomas> useless now, so we can remove these.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
