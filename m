From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Fri, 11 Apr 2014 18:17:11 -0300
Subject: [Buildroot] [PATCH] toolchain-external: Introduce kernel
	headers sanitization
In-Reply-To: <1396876362-32296-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1396876362-32296-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <CAAEAJfA50kHW1xHh_8OhOQ6eLAJ1_qnzn-UWS1mDPU_QRkezjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 7 April 2014 10:12, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
> The Nios-II Sourcery external toolchain (the only Nios-II we currently
> support) exports broken kernel headers. In particular, these kernels should
> be exported using the "headers_install" rule which applies a set of fixes
> on the kernel headers so they are suitable for userspace usage.
>
> In order to fix this, let's introduce a compile-time hidden option, to be
> selected by such broken toolchains, and perform the header fixes ourselves.
> The result is equivalent to apply the "headers_install" rule.
>
> Fixes:
> http://autobuild.buildroot.net/results/c32/c32ad4bac5f651502e551f7733f702afaa0e742a/
>
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
> /me hopes this is not too ugly!
>

ping?
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
