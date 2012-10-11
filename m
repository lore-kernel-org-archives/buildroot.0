From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 11 Oct 2012 11:26:59 +0200
Subject: [Buildroot] [PATCH 11/11] libecore: fix build with glibc >=2.16
In-Reply-To: <87ipai584z.fsf@macbook.be.48ers.dk>
References: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
 <1342963719-1810-12-git-send-email-s.martin49@gmail.com>
 <87ipai584z.fsf@macbook.be.48ers.dk>
Message-ID: <CAHXCMM+YjpZ7beReUic3U_z4A-U2h+4hcGk0_8LwSdC7CJUWQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2012/10/10 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:
>
> Hi,
>
>  Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
>  Samuel>  create mode 100644 package/efl/libecore/libecore-ecore_exec-c-fix-build-with-glibc-2-16.patch
>
>  Samuel> diff --git a/package/efl/libecore/libecore-ecore_exec-c-fix-build-with-glibc-2-16.patch b/package/efl/libecore/libecore-ecore_exec-c-fix-build-with-glibc-2-16.patch
>  Samuel> new file mode 100644
>  Samuel> index 0000000..9d53dfd
>  Samuel> --- /dev/null
>  Samuel> +++ b/package/efl/libecore/libecore-ecore_exec-c-fix-build-with-glibc-2-16.patch
>  Samuel> @@ -0,0 +1,62 @@
>  Samuel> +This patch fix build with glibc-2.16, avoiding the following error occurs:
>  Samuel> +
>
> Did you send this patch upstream? If so, what is the status of it?
Arf... Got lost in my mailbox... So no, I haven't sent it upstream.

I willl check upstream and let you know its status.


-- 
Sam
