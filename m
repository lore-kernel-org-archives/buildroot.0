From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Mon, 28 Nov 2011 13:02:11 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <CAAu5YTbrKzjHZn2=r_mM6rPJD=p7SY=yd5x+Z7yz2-meopthLA@mail.gmail.com>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98><20111122230429.2bef52c2@skate><005d01cca963$b9a61eb0$0400a8c0@dspcgrnzks9p98><20111122232914.76a86e7d@skate><006101cca967$050bb240$0400a8c0@dspcgrnzks9p98><CAAXf6LVFSZpPxtsu9DmiEtw9LjNtdEWGQ+zdBQhscRAZ67vu_Q@mail.gmail.com><001001ccaa28$4b7515c0$0400a8c0@dspcgrnzks9p98><CAAXf6LVDR+9KnTJP36-hugA51QTikDsQ2ESO4c3C9-L8UJgqBA@mail.gmail.com><001e01ccaddf$81c0f300$0400a8c0@dspcgrnzks9p98><20111128161124.0f95d0d4@skate><001f01ccade1$204918d0$0400a8c0@dspcgrnzks9p98><20111128165422.49361aed@skate><002001ccade8$e03e9f00$0400a8c0@dspcgrnzks9p98>
 <CAAu5YTbrKzjHZn2=r_mM6rPJD=p7SY=yd5x+Z7yz2-meopthLA@mail.gmail.com>
Message-ID: <002b01ccae00$3c97b4f0$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Try "make ethercat-dirclean"

This removed output/build/ethercat-1.0

> "rm dl/ethercat*"

No files like this existed.

> "make ethercat"

Same problem still.  What makes Buildroot think it has the file in dl
already?

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111128/a78bddbf/attachment.html>
