From: Marcelo Gutierrez <kuyurix@gmail.com>
Date: Tue, 4 Mar 2014 14:53:58 -0300
Subject: [Buildroot] [PATCH 1/2] mysql: add option to build the server
In-Reply-To: <20140304055103.GX3874@tarshish>
References: <1392244774-15356-1-git-send-email-kuyurix@gmail.com>
 <20140303233551.75c74c6a@skate>
 <CA+kK6WsRpy_8rvtVb6iSrBNYCB-QOsKCP18STAP6RNDj434yPg@mail.gmail.com>
 <20140304055103.GX3874@tarshish>
Message-ID: <CA+kK6Wt_DD+FH5FxpEvGh_9t4=3jyBxH02ZhyD2W6T8cM0B+JQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

You can to this by setting the MYSQL_USERS variable. See the example in
> section 7.2.4 of the manual
> (http://buildroot.net/downloads/manual/manual.html), and section 12.2 for
> syntax details.
>

@Baruch: Thank you so much for the information.

700101 00:00:22 mysqld_safe Starting mysqld daemon with databases from
> /usr/var
> /usr/bin/mysqld_safe: line 595: can't create /usr/var/buildroot.err:
> nonexistent directory
> /usr/bin/mysqld_safe: eval: line 1: can't create /usr/var/buildroot.err:
> nonexistent directory
>

@Thomas: Issue fixed.(http://patchwork.ozlabs.org/patch/326422/)

Regards,
Marcelo.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140304/b41d65be/attachment.html>
