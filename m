From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Wed, 23 Nov 2011 15:38:51 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <CAAXf6LVFSZpPxtsu9DmiEtw9LjNtdEWGQ+zdBQhscRAZ67vu_Q@mail.gmail.com>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98><20111122230429.2bef52c2@skate><005d01cca963$b9a61eb0$0400a8c0@dspcgrnzks9p98><20111122232914.76a86e7d@skate><006101cca967$050bb240$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LVFSZpPxtsu9DmiEtw9LjNtdEWGQ+zdBQhscRAZ67vu_Q@mail.gmail.com>
Message-ID: <001001ccaa28$4b7515c0$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to the documentation for making the .mk file
(http://buildroot.uclibc.org/buildroot.html#autotools-tutorial), what is the
syntax for specifying a local (hard drive location) of the .bz2 file?

LIBFOO_SITE = http://www.foosoftware.org/download

Is the example given.  Can I just do something like

LIBFOO_SITE = /home/libfoo.tar.bz2
?

Thanks.
