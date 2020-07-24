From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 24 Jul 2020 21:14:45 +0200
Subject: [Buildroot] buildroot compilation error
In-Reply-To: <CAKBF_5rzmSryuzdhs7oSHobxTVNYL_H7Lj04uxjZY+6UaNK=nA@mail.gmail.com>
References: <CAKBF_5rzmSryuzdhs7oSHobxTVNYL_H7Lj04uxjZY+6UaNK=nA@mail.gmail.com>
Message-ID: <20200724211445.536ef09b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Billa,

On Fri, 24 Jul 2020 12:16:16 +0530, Billa Surendra <billa.iitmadras@gmail.com> wrote:

> Dear all,
>
> I am getting errors while compiling buildroot for riscv architecture. Can
> anyone please help me regarding this?.
>
> Error:
>
> fseeko.c: In function 'rpl_fseeko':
> fseeko.c:109:4: error: #error "Please port gnulib fseeko.c to your
> platform! Loo         k at the code in fseeko.c, then report this to
> bug-gnulib."
>   109 |   #error "Please port gnulib fseeko.c to your platform! Look at the
> code          in fseeko.c, then report this to bug-gnulib."
>       |    ^~~~~
> make[5]: *** [Makefile:1842: fseeko.o] Error 1
> make[5]: *** Waiting for unfinished jobs....
> freadahead.c: In function 'freadahead':
> freadahead.c:91:3: error: #error "Please port gnulib freadahead.c to your
> platfo         rm! Look at the definition of fflush, fread, ungetc on your
> system, then report          this to bug-gnulib."
>    91 |  #error "Please port gnulib freadahead.c to your platform! Look at
> the d         efinition of fflush, fread, ungetc on your system, then
> report this to bug-gnuli         b."

Mind to provide a .config (or defconfig) file? Which buildroot version?

Regards,
Peter

>
> Thanks and regards
> Billa Surendra
