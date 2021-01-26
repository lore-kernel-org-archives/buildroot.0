From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 26 Jan 2021 18:58:34 +0100
Subject: [Buildroot] [PATCH] package/ltp-testsuite: simplify code to
 exclude test-cases
In-Reply-To: <20210126174741.1046950-1-yann.morin.1998@free.fr>
References: <20210126174741.1046950-1-yann.morin.1998@free.fr>
Message-ID: <YBBYSkMrryKEr3yx@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> We have three conditions under which some tests may get removed:
> uClibc, musl, static libraries. All three use the same mechanism
> to exclude those test-cases: remove the files.

> The first two use a common variable to list the affected files,
> and share the same hook of their own to iterate over that list,
> while the third has its own hook.

> This is not very clean, so switch to using a single variable and
> a single hook for all three conditions.
Nice cleanup, thank you!

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
