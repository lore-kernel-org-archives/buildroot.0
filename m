From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Oct 2019 00:48:23 +0200
Subject: [Buildroot] [RFC PATCH 2/4] package/lld: new package
In-Reply-To: <20190724173538.22913-3-joseph.kogut@gmail.com>
References: <20190724173538.22913-1-joseph.kogut@gmail.com>
 <20190724173538.22913-3-joseph.kogut@gmail.com>
Message-ID: <8f37b70c-e974-2983-dd2f-ec4a74dcf393@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24/07/2019 19:35, Joseph Kogut wrote:
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

 Applied to master, thanks. Not very useful as is, but it will give some
autobuilder exposure.

[snip]
> +config BR2_PACKAGE_HOST_LLD
> +	bool "host lld"
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # llvm
> +	depends on BR2_HOST_GCC_AT_LEAST_4_8 # llvm
> +	select BR2_PACKAGE_HOST_LLVM

 This symbol doesn't exist, so I removed it.

 Regards,
 Arnout

[snip]
