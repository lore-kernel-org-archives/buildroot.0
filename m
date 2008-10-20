From: Hai Zaar <haizaar@haizaar.com>
Date: Mon, 20 Oct 2008 18:11:56 +0200
Subject: [Buildroot] Can not compile strace
In-Reply-To: <87ljwjljqr.fsf@macbook.be.48ers.dk>
References: <76d9e2a30810191813s629af379kedd4da294a8f7cf2@mail.gmail.com>
	<87ljwjljqr.fsf@macbook.be.48ers.dk>
Message-ID: <76d9e2a30810200911q7550aea5lb3db7be649bff385@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 20, 2008 at 11:05 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Hai" == Hai Zaar <haizaar@haizaar.com> writes:
>
>  Hai> I'm building current buildroot with 2.6.27 for at91sam9260
>  Hai> strace fails to compile with the following error:
>  Hai> file.c:41:26: error: linux/dirent.h: No such file or directory
>
>  Hai> It looks like build_arm/staging_dir/usr/include/linux/dirent.h does
>  Hai> not exist any more.
>  Hai> How can I fix that?
>
> Thanks for reporting it - Fixed in r23735.
Wow! That was fast! Thank you!
I confirm that it works now.

>
> --
> Bye, Peter Korsgaard
>



-- 
Zaar
