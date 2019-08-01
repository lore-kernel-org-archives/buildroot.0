From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Aug 2019 21:13:06 +0200
Subject: [Buildroot] [PATCH v2] package/gst1-plugins-good: add shout2
 plugin option
In-Reply-To: <20190705215038.12927-1-abloemert@gmail.com>
References: <20190705065015.29773-1-abloemert@gmail.com>
 <20190705215038.12927-1-abloemert@gmail.com>
Message-ID: <54ebdfc0-2580-ac73-98d4-8055cccb6682@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/07/2019 23:50, Arnold Bloemert wrote:
[snip]
> +config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SHOUT2
> +        bool "shout2"
> +        select BR2_PACKAGE_LIBSHOUT
> +        help
> +          Elements to send data to an icecast server using libshout2

 The indentation was wrong here. Please use utils/check-package to check things
before sending.

 I've fixed it and applied to master, so no need to resend, thanks.

 Regards,
 Arnout

[snip]
