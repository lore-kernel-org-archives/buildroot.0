From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 10:29:14 +0100
Subject: [Buildroot] [PATCH v6 05/16] erlang-lager: new package.
In-Reply-To: <1421055140-5092-6-git-send-email-johan.oudinet@gmail.com>
References: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
 <1421055140-5092-6-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20150203102914.1bd5b7d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Mon, 12 Jan 2015 10:32:09 +0100, Johan Oudinet wrote:

> diff --git a/package/erlang-lager/Config.in b/package/erlang-lager/Config.in
> new file mode 100644
> index 0000000..b7994fe
> --- /dev/null
> +++ b/package/erlang-lager/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_ERLANG_LAGER
> +	bool "erlang-lager"
> +	select BR2_PACKAGE_ERLANG_GOLDRUSH
> +	help
> +	  Logging framework for Erlang.

This line of help text was not really needed, since it's an information
already part of the following paragraph.

> +	  

This had some trailing whitespace.

Committed with this fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
