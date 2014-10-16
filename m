From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Thu, 16 Oct 2014 08:44:42 -0500
Subject: [Buildroot] [PATCH 1/2] pps-tools: new package
In-Reply-To: <1413405475-5179-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1413405475-5179-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <CAMQcK5+7ax9G1pMWLDRXO7dS80zEE49s9=dHgvOOVdKXcHaf+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt,

On Wed, Oct 15, 2014 at 3:37 PM, Matt Weber
<matthew.weber@rockwellcollins.com> wrote:

[...]

> diff --git a/package/pps-tools/pps-tools.mk b/package/pps-tools/pps-tools.mk
> new file mode 100644
> index 0000000..4ebfb1e
> --- /dev/null
> +++ b/package/pps-tools/pps-tools.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# pps-tools
> +#
> +################################################################################
> +PPS_TOOLS_VERSION = 0deb9c7e135e9380a6d09e9d2e938a146bb698c8
> +PPS_TOOLS_SITE = https://github.com/ago/pps-tools.git
> +PPS_TOOLS_SITE_METHOD = git

Does the github helper work for downloading this package? I think it
is prefer to use the git hub helper as described in the manual at
http://buildroot.org/downloads/manual/manual.html#github-download-url

Thanks,
-Ryan
