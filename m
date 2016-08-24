From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 24 Aug 2016 09:12:00 +0200
Subject: [Buildroot] [PATCH/next 2/4] DEVELOPERS: add initial list of
 Buildroot developers
In-Reply-To: <1471902678-18693-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1471902678-18693-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471902678-18693-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAB0FRssn5j1O4TiWpRVoZYiJptKF7g8xBUL5D6y2cnqenchueg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-08-22 23:51 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> This is an initial list of Buildroot developers. It has been created
> semi-automatically by parsing the Git history, and finding the authors
> of commits with a title like "<foo>: new package". Some additional
> manual tweaking has been done (merging multiple entries corresponding to
> the same person, adding some more entries, etc.).
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  DEVELOPERS | 1375 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


Hello Thomas,

+N:     Francois Perrad <fperrad@gmail.com>

Please update my address with <francois.perrad@gadz.org>

And add some missing packages:

F:     board/olimex/a20_olinuxino
F:     configs/olimex_a20_olinuxino_*

+F:     package/4th/
+F:     package/botan/
+F:     package/cosmo/
+F:     package/dado/
+F:     package/ficl/
+F:     package/gdbm/
+F:     package/libtomcrypt/
+F:     package/libtommath/
+F:     package/libump/
+F:     package/linenoise/
+F:     package/ljlinenoise/
+F:     package/lpeg/
+F:     package/lpty/
+F:     package/lrandom/
+F:     package/lsqlite3/
+F:     package/lua*
+F:     package/lunit/
+F:     package/lzlib/

F:     package/moarvm

+F:     package/perl*

F:     package/pkg-perl.mk
F:     package/pkg-luarocks.mk

+F:     package/qemu/
+F:     package/tekui/

Fran?ois
