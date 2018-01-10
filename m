From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Wed, 10 Jan 2018 09:22:06 +0100
Subject: [Buildroot] [PATCH v3 2/8] security hardening: add RELFO,
 FORTIFY options
In-Reply-To: <1515557739-6027-2-git-send-email-matthew.weber@rockwellcollins.com>
References: <1515557739-6027-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1515557739-6027-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1341e9d3-f42a-2162-1f47-6cc2b53716a4@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/01/2018 05:15, Matt Weber wrote:
> [...]
> +config BR2_RELRO_NONE
> +	bool "None"
> +	help
> +	  Enables Relocation link-time protections.

Disables ?

> +config BR2_FORTIFY_SOURCE_NONE
> +	bool "None"
> +	help
> +	  Enables additional checks to detect buffer-overflows.

And here too ?
