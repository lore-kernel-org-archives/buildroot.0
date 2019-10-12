From: Petr Vorel <petr.vorel@gmail.com>
Date: Sat, 12 Oct 2019 23:11:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: fix build with
 musl-fts
In-Reply-To: <20191011171547.3281-1-fontaine.fabrice@gmail.com>
References: <20191011171547.3281-1-fontaine.fabrice@gmail.com>
Message-ID: <20191012211130.GA28854@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

> Fixes:
>  - http://autobuild.buildroot.org/results/7a4b54768584b2ec95f7f5c0932d0161ab8e43d5

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Too late to ack this, so at least thanks for implementing it :)..

It'd make sense to note, that this fixes build for uclibc
without UCLIBC_HAS_FTS.
MUSL (if it had LTP support) wouldn't suffer this error (compilation would be
skipped due missing fts.h).

Kind regards,
Petr
