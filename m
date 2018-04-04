From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Apr 2018 22:10:53 +0200
Subject: [Buildroot] [PATCH v3 0/5] New pkg-stats script,
 with version information
In-Reply-To: <20180323205455.24789-1-thomas.petazzoni@bootlin.com>
References: <20180323205455.24789-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180404221053.71fd1036@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Mar 2018 21:54:50 +0100, Thomas Petazzoni wrote:

> Thomas Petazzoni (5):
>   support/scripts/pkg-stats-new: rewrite in Python
>   support/scripts/pkg-stats-new: add -n and -p options
>   support/scripts/pkg-stats-new: add current version information

I have applied those three patches, after fixing the commit log of the
first patch, as noticed by Ricardo.

>   support/scripts/pkg-stats-new: add latest upstream version information

I've left this patch unapplied, since Ricardo is still reporting issues
with it. I'll mark it as Changes Requested.

>   support/scripts/pkg-stats: replace with new Python version

I've applied this one as well, rebased on top of
"support/scripts/pkg-stats-new: add current version information", so
that pkg-stats-new effectively replaces pkg-stats from now on.

Thanks Ricardo again for all the review on this patch series. Let's
continue to work together to find a proper solution to retrieve the
latest upstream version information.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
