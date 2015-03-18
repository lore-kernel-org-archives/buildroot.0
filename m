From: Steve Kenton <skenton@ou.edu>
Date: Wed, 18 Mar 2015 00:03:02 -0500
Subject: [Buildroot] [PATCH] package/dvdrw-tools: fix incorrect default
 choiche
In-Reply-To: <1426631327-15489-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1426631327-15489-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <55090706.9060600@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/17/2015 05:28 PM, Angelo Compagnucci wrote:
> This pathc fixes default choiche BR2_PACKAGE_DVDRW_TOOLS_CDRKIT_BACKEND.

>  if BR2_PACKAGE_DVDRW_TOOLS
>  choice
>  	prompt "Media Backend"
> -	default BR2_PACKAGE_DVDRW_CDRKIT_BACKEND
> +	default BR2_PACKAGE_DVDRW_TOOLS_CDRKIT_BACKEND

Arg! I can't I let that slip through. Thanks for catching it.

Steve
