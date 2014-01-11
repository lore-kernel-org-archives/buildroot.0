From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Jan 2014 23:47:15 +0100
Subject: [Buildroot] [PATCH] Compile static versions of gcc libraries
In-Reply-To: <1381398042-6925-1-git-send-email-jezz@sysmic.org>
References: <1381398042-6925-1-git-send-email-jezz@sysmic.org>
Message-ID: <CACXmViaGn2BhqVwU=SpeCt7V1ujWh4gGRgTvu9DiJUv-6MR-pg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 10, 2013 at 11:40 AM, J?r?me Pouiller <jezz@sysmic.org> wrote:
> Since default configure options for host packages include
> --disable-static, gcc was not configured to build static version of its
> libraries (libgcc.a, libstdc++.a, ...).
>
> This patch replace --disable-static by --enable-static in configure
> command. Notice some options was removed sinces they was ignored by gcc
> configure script.
>
> Once it was compiled, this commit takes care to copy static libraries to
> $STAGING
>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Committed, thanks.


-- 
Bye, Peter Korsgaard
