From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 4 Jan 2016 16:09:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/sp-oops-extract: consolidate
 use of stdint types
In-Reply-To: <1451917380-2270-1-git-send-email-rdkehn@yahoo.com>
References: <1451917380-2270-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <568A8B0D.80602@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Doug,

Doug Kehn wrote:
> Change u_int*_t to uint*_t for compatibility with a larger number of C
> libraries.
>
> This patch resolves 2016-01-02 auto-build failure. This patch has also
> been submitted upstream (ptxdist at pengutronix.de).

Adding the URL of the build failure webpage is a good practice. It
allows reviewers to have a look at the problem you're fixing.

See for example:

 
https://git.busybox.net/buildroot/commit/?id=a5ec50b2cc874a2e8a711792d673f0c51b5142b2

-- 
Luca
