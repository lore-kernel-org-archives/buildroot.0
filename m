From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 May 2016 23:04:50 +0200
Subject: [Buildroot] [PATCH] Config.in: wrap to column width 72
In-Reply-To: <1464298507-22817-1-git-send-email-martin@surround.io>
References: <1464298507-22817-1-git-send-email-martin@surround.io>
Message-ID: <20160527230450.10a646c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this patch. Looks good, except for one thing.

On Thu, 26 May 2016 14:35:07 -0700, Martin Kelly wrote:

> +	  Command to be used to extract a gzip'ed file to stdout.  zcat

Why do you have two spaces after the . here ? Only one is enough.

There are other occurrences of the same issue in the rest of the patch.
Could you fix this and send an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
