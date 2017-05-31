From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 21:17:41 +0200
Subject: [Buildroot] [PATCH v2 3/4] erlang-p1-xmpp: New package
In-Reply-To: <20170531163545.23552-3-johan.oudinet@gmail.com>
References: <20170531163545.23552-1-johan.oudinet@gmail.com>
 <20170531163545.23552-3-johan.oudinet@gmail.com>
Message-ID: <20170531211741.03e26ae0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 May 2017 18:35:44 +0200, Johan Oudinet wrote:
> XMPP library for Erlang.
> https://github.com/processone/xmpp
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

I've applied to next. However, I have a request for upcoming patches.

> diff --git a/package/erlang-p1-xmpp/0001-fix-includes.patch b/package/erlang-p1-xmpp/0001-fix-includes.patch
> new file mode 100644
> index 0000000000..d0a267b721
> --- /dev/null
> +++ b/package/erlang-p1-xmpp/0001-fix-includes.patch
> @@ -0,0 +1,16 @@
> +Without this patch, rebar fails to find include file fxml.hrl.
> +
> +Signed-off-by: Christophe Romain <cromain@process-one.net>

Since all those packages are hosted in Git repository, we would very
much prefer to have patches created with "git format-patch", as they
can more easily be applied using "git am".

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
