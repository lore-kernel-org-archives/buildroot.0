From: Marcelo Gutierrez <kuyurix@gmail.com>
Date: Mon, 24 Feb 2014 16:38:16 -0300
Subject: [Buildroot] [PATCH 1/2] mysql: add option to build the server
In-Reply-To: <87ios5oab9.fsf@dell.be.48ers.dk>
References: <1392244774-15356-1-git-send-email-kuyurix@gmail.com>
 <87ios5oab9.fsf@dell.be.48ers.dk>
Message-ID: <CA+kK6Wv3M6qes_QnjBz0NLvMzrqe3uSZuXLggoua0OXoA-dthA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, all,


>  > diff --git a/package/mysql/mysql-0005-
> bison_3_breaks_mysql_server_build.patch
> b/package/mysql/mysql-0005-bison_3_breaks_mysql_server_build.patch
>  > new file mode 100644
>  > index 0000000..918fe24
>  > --- /dev/null
>  > +++ b/package/mysql/mysql-0005-bison_3_breaks_mysql_server_build.patch
>  > @@ -0,0 +1,3310 @@
>  > +fix the yacc code in mysql
>
> Fix in what way?


Build fails due to changes in the newest Bison, so I made porting to Bison
3.x to fix this MySQL bug:
http://bugs.mysql.com/bug.php?id=71250

Regards,
Marcelo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140224/7a48582a/attachment.html>
