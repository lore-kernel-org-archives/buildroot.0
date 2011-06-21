From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Tue, 21 Jun 2011 11:54:13 +0200
Subject: [Buildroot] [PATCH] ext-toolchain-wrapper.c: Handle an
	arbitrary amount of arguments
In-Reply-To: <1308649845-21724-1-git-send-email-daniel.nystrom@timeterminal.se>
References: <1308649845-21724-1-git-send-email-daniel.nystrom@timeterminal.se>
Message-ID: <BANLkTingz3ixGb1BhPtHtM-FuKF_0723iQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Den 21 juni 2011 11:50 skrev Daniel Nystr?m <daniel.nystrom@timeterminal.se>:
> Even though MAXARGS 1000 seems large, it wasn't enought for at least
> QtWebKit package. This new version does not have any predefined limits.
>
> Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
> Reported-by: Thomas Bj?rk <thomas.bjork@home.se>

Forgot:
Fixes #3907: https://bugs.busybox.net/show_bug.cgi?id=3907
