From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Fri, 17 Mar 2017 20:34:01 +0530
Subject: [Buildroot] [PATCH v2] libkcapi: new package
In-Reply-To: <1489741879-13900-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1489741879-13900-1-git-send-email-marcin.nowakowski@imgtec.com>
Message-ID: <c1e56596-82f0-ea20-98d1-4121bc3c58d3@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Friday 17 March 2017 02:41 PM, Marcin Nowakowski wrote:
> This package provides a userspace library that allows easy use of crypto
> interfaces exposed by the kernel.
>
> A git tip is used instead of the last official release, as autotools
> support and cross-compilation fixes have been added only very recently.
>
> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
>
> ---
> v2:
> 	Remove unnecessary AUTORECONF_OPTS
> 	Update to latest git hash
> 	Config: depends on ... -> if ...
> 	Add all license files

It looks good to me.

Reviewed-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>

Thanks,
Rahul
