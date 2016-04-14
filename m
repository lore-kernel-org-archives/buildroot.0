From: Mason <slash.tmp@free.fr>
Date: Thu, 14 Apr 2016 21:29:34 +0200
Subject: [Buildroot] [PATCH v3] ltp-testsuite: build kernel modules when
	appropriate
In-Reply-To: <57039CF4.5060902@free.fr>
References: <56F3F393.6020407@free.fr>
 <20160324222555.21f04320@free-electrons.com> <56F92840.9090206@free.fr>
 <56FAD38B.8040201@mind.be> <57026754.50205@free.fr> <57038409.20600@mind.be>
 <57039CF4.5060902@free.fr>
Message-ID: <570FEF9E.6000400@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/04/2016 13:09, Mason wrote:

> If we're building a kernel, we can also build LTP's test modules.
> ---
>  package/ltp-testsuite/ltp-testsuite.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Are there remaining issues with this patch?

Regards.
