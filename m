From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Feb 2012 09:11:50 -0300
Subject: [Buildroot] build of e2fsprogs fails (2012.02-rc3)
In-Reply-To: <1330427777.2274.27.camel@sven>
References: <1330427777.2274.27.camel@sven>
Message-ID: <3d41058a0f241311e2b0fe5c2e3c9d1c@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-02-28 08:16, Sven Neumann wrote:

> Hi,
>
> the build of e2fsprogs fails with 2012.02-rc3:
>
> 	CC e4defrag.c
> e4defrag.c:28:17: fatal error: ftw.h: No such file or directory
> compilation terminated.

What about your uclibc config?
If you're using a custom uclibc config basically "you're on your own" 
if packages break.
Like on bug #4736 you reported.
Packages are tested to work on buildroot's-shipped default uclibc 
configurations.
At least that's my take.
Regards.
