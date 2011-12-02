From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Fri, 2 Dec 2011 16:09:35 +0000
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <001201ccb10b$22c23010$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <001c01ccb07c$85e85190$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LUnHUAQk_4j2fyjE_tYum+U-i08aUKksK__tLOu0XgMeA@mail.gmail.com>
 <201112020734.00122.minimod@morethan.org>
 <001201ccb10b$22c23010$0400a8c0@dspcgrnzks9p98>
Message-ID: <CAAu5YTas_VmvbHEkwOZqVZ3iD+sy4nYdmykMKZAagtAEYViYHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2 Noll 2011 15:58, "Jeff Krasky" <jeff.krasky@dspcg.com> wrote:
>
> Ok, ok, I'm tryin again from the 2011.11 version.  Can someone at least
say
> if there is a way to just clean the ethercat part?  Like a
>
> 'make clean-igh-ethercat' or something?
>
>
>

make igh-ethercat-clean to run the clean commands for the package. (in the
..._CLEAN_CMDS variable in the .mk file)

make igh-ethercat-dirclean to start from blank build directory again.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111202/48a3b675/attachment.html>
