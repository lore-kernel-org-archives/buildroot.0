From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Tue, 21 Jun 2011 21:50:58 +0200
Subject: [Buildroot] [PATCH v2] ext-toolchain-wrapper.c: Handle an
	arbitrary amount of arguments
In-Reply-To: <1308685678-6006-1-git-send-email-daniel.nystrom@timeterminal.se>
References: <1308685678-6006-1-git-send-email-daniel.nystrom@timeterminal.se>
Message-ID: <BANLkTim33aDgWdBuwHA2HLL4J9vxtJmobw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Den 21 juni 2011 21:47 skrev Daniel Nystr?m <daniel.nystrom@timeterminal.se>:
> Even though MAXARGS 1000 seems large, it wasn't enought for at least
> QtWebKit package. This new version does not have any predefined limits.
>
> Closes #3907
>
> Many thanks to Thomas for tracing the source of the build error.
>
> Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
> Reported-by: Thomas Bj?rk <thomas.bjork@home.se>
> ---
>
> New in v2:
> ?* Check for malloc returning NULL
> ?* Remove unused variable 'i'
> ?* Add closing bug # in commit message

Please ignore. Last changes (mentioned above) wasn't applied in the
patch. v3 on it's way.
