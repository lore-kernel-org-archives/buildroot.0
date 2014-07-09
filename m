From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 9 Jul 2014 16:45:36 +0000
Subject: [Buildroot] [PATCH] uclibc: fix tests building in uClibc
	0.9.33.2
In-Reply-To: <0565f572-9253-4d0c-992b-6de65c123f83@email.android.com>
References: <1404069506-13826-1-git-send-email-abrodkin@synopsys.com>
 <0565f572-9253-4d0c-992b-6de65c123f83@email.android.com>
Message-ID: <1404924336.4553.24.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Peter,


On Sun, 2014-06-29 at 21:37 +0200, Thomas De Schampheleire wrote:
> Alexey Brodkin <Alexey.Brodkin@synopsys.com> schreef:
> >Following patches are required for successful bulding of uClibc built-int tests
> >(BR2_UCLIBC_INSTALL_TEST_SUITE=y):
> >
> >1.
> >uclibc-0059-test-cater-for-config.patch
> >http://git.uclibc.org/uClibc/commit/test?id=7598eeaa1defa2884adaa890bb115c493d69cc35
> >
> >2.
> >uclibc-0058-test-tls-fix-build-with-newer-binutils.patch
> >http://git.uclibc.org/uClibc/commit/test?id=931e8391565323ed2e589c83b83a7345813a5514
> >
> >3.
> >uclibc-0060-test-Fix-math-c-dependency.patch
> >http://git.uclibc.org/uClibc/commit/test/math?id=a20a91ad7c042c46e4a2adee6d03315f857f9985
> >
> >All mentioned patches must be removed as obsolete on bumping uClibc to the next
> >release.
> >
> >Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Any chance to get it applied?
This allows people compile uClibc tests so IMHO is useful.

-Alexey
