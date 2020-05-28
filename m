From: Todd Sampson <sampsonats@gmail.com>
Date: Thu, 28 May 2020 16:51:27 -0400
Subject: [Buildroot] Cross-compile mariadb-connector-c
Message-ID: <CADJjDh8R+_9Br-O9Dgy3Pp=WU7duOnOYEajGX3NJg324AaBx6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to cross-compile mariadb-connector-c version 3.1.8.  When I
select mysqlsupport and mariadb, it seems like the mariadb server gets put
in my target too, which makes it very big.

dfr at cmake:~/m9k2/buildroot$ ll -d output/build/maria*
drwxr-xr-x 34 dfr dfr 4096 May 28 13:00 *output/build/mariadb-10.3.23/*
drwxr-xr-x 15 dfr dfr 4096 May 28 13:05
output/build/mariadb-connector-c-3.1.8/

[image: mariadb-connector-selection.PNG]
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200528/cdef2393/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mariadb-connector-selection.PNG
Type: image/png
Size: 111312 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200528/cdef2393/attachment-0001.png>
