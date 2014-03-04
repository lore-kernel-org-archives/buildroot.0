From: Marcelo Gutierrez <kuyurix@gmail.com>
Date: Mon, 3 Mar 2014 23:39:59 -0300
Subject: [Buildroot] [PATCH 1/2] mysql: add option to build the server
In-Reply-To: <20140303233551.75c74c6a@skate>
References: <1392244774-15356-1-git-send-email-kuyurix@gmail.com>
 <20140303233551.75c74c6a@skate>
Message-ID: <CA+kK6WsRpy_8rvtVb6iSrBNYCB-QOsKCP18STAP6RNDj434yPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all



I've applied this, but:
>
>  1/ The package lacks an init script to start the MySQL server
>     automatically.
>
>  2/ When mysqld_safe is started automatically, it looks for stuff
>     in /usr/var that doesn't exist:
>
> 700101 00:00:22 mysqld_safe Starting mysqld daemon with databases from
> /usr/var
> /usr/bin/mysqld_safe: line 595: can't create /usr/var/buildroot.err:
> nonexistent directory
> /usr/bin/mysqld_safe: eval: line 1: can't create /usr/var/buildroot.err:
> nonexistent directory
>

I can fix that but we'll need to add a mysql user and I have no idea how do
it

Regard,
Marcelo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140303/fe014a7e/attachment.html>
