From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 2 May 2014 13:22:30 +0200
Subject: [Buildroot] [PATCH] manual: fix C++ suport in libc case,
	fix indentation
In-Reply-To: <1399027768-28337-1-git-send-email-yann.morin.1998@free.fr>
References: <1399027768-28337-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAAXf6LXaMFu-bgxabW_TqD++oQ8dndrY8VHrvj+FBNz_WEi=CA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 2, 2014 at 12:49 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> The manual has this sentence for the dependency on a C library *and* a
> toolchain feature:
>
>     foo needs an (e)glibc toolchain, or foo needs an (e)glibc toolchain
>     w/ C++ support
>
> And then, just below, the comment text for C++ is just 'C++', not
> 'C++ support'.
>
> Fix that, and add a bit of indentation too.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

I checked the Config.in files and fortunately this mistake was not yet applied.

Thanks for noticing!

Thomas
