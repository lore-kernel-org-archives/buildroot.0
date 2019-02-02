From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Feb 2019 14:37:26 +0100
Subject: [Buildroot] [PATCHv2 1/1] package/pugixml: add support for a
 limited set of configuration options
In-Reply-To: <20190131074019.19252-1-patrickdepinguin@gmail.com>
References: <20190131074019.19252-1-patrickdepinguin@gmail.com>
Message-ID: <5166d507-189b-f139-f9a7-c0cac006f014@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31/01/2019 08:40, Thomas De Schampheleire wrote:
> +config BR2_PACKAGE_PUGIXML_FORCE_ENABLE_LONG_LONG
> +	bool "Force-enable long long support"
> +	help
> +	  Force-enables support for long long type in pugixml.  Long
> +	  long support is automatically enabled if your platform is
> +	  known to have long long support (i.e. has C++11 support or
> +	  uses a reasonably modern version of a known compiler). If
> +	  pugixml does not recognize that your platform supports long
> +	  long but in fact it does, you can enable the define manually.
> +endif

 AFAIK gcc always supports long long, so shouldn't we just always enable this?

 Regards,
 Arnout
