From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Mon, 28 Nov 2011 18:55:18 +0000
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <002001ccade8$e03e9f00$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <20111122230429.2bef52c2@skate>
 <005d01cca963$b9a61eb0$0400a8c0@dspcgrnzks9p98>
 <20111122232914.76a86e7d@skate>
 <006101cca967$050bb240$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LVFSZpPxtsu9DmiEtw9LjNtdEWGQ+zdBQhscRAZ67vu_Q@mail.gmail.com>
 <001001ccaa28$4b7515c0$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LVDR+9KnTJP36-hugA51QTikDsQ2ESO4c3C9-L8UJgqBA@mail.gmail.com>
 <001e01ccaddf$81c0f300$0400a8c0@dspcgrnzks9p98>
 <20111128161124.0f95d0d4@skate>
 <001f01ccade1$204918d0$0400a8c0@dspcgrnzks9p98>
 <20111128165422.49361aed@skate>
 <002001ccade8$e03e9f00$0400a8c0@dspcgrnzks9p98>
Message-ID: <CAAu5YTbrKzjHZn2=r_mM6rPJD=p7SY=yd5x+Z7yz2-meopthLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28 Samh 2011 16:15, "Jeff Krasky" <jeff.krasky@dspcg.com> wrote:
...
>
> So any thoughts on why it is not finding the file?
>

Try "make ethercat-dirclean", then "rm dl/ethercat*" and finally, "make
ethercat". The stamp files or a partial download may be confusing matters.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111128/8be27223/attachment.html>
