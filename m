From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 May 2013 12:11:55 +0200
Subject: [Buildroot] [PATCH] Choose xz compressed tarball for linux
 kernel.
In-Reply-To: <201305110104.51488.rasasi78@gmail.com>
References: <201305110104.51488.rasasi78@gmail.com>
Message-ID: <20130511121155.0377f81f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ra?l S?nchez Siles,

On Sat, 11 May 2013 01:04:51 +0200, Ra?l S?nchez Siles wrote:
>   Hi:
> 
>   This is a retry of previous patch, now inlined as requested. Patch is the same 
> as before so no patch version increased.
> 
>   I wanted to apologize to Jerzy for my abrupt appearance: I had this patch 
> working some time ago and it was standing in my "to send" queue. I was also 
> willing to contribute buildroot somehow.
> 
>   Regards,
> 
> Signed-off-by: Ra?l S?nchez Siles <rasasi78@gmail.com>
> ---
>  linux/linux.mk                             |    2 +-
>  toolchain/kernel-headers/kernel-headers.mk |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Thanks, but your commit log shouldn't contain "personal messages". It
should contain a description of what the patch is. Basically, anything
that's before the "---" remains forever in the Git history of
Buildroot. If you want to put "personal" messages, or a changelog, or
anything like that, please put it after the "---", or in a separate
e-mail that serves as a cover letter.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
