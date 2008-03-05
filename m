From: sjhill at realitydiluted.com <sjhill@realitydiluted.com>
Date: Wed, 5 Mar 2008 10:59:10 -0600
Subject: [Buildroot] Glibc instead of uclibc
In-Reply-To: <c05908680803050744i38177299u2af49445fdff5990@mail.gmail.com>
References: <c05908680803050744i38177299u2af49445fdff5990@mail.gmail.com>
Message-ID: <20080305165910.GA1935@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The only way to use glibc is to build an external glibc toolchain and
then specify using an external toolchain in buildroot.

-Steve
