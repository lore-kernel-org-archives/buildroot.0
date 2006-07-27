From: Drew Cohan <drewcohan@gmail.com>
Date: Thu Jul 27 12:46:38 2006
Subject: [Buildroot] Busybox & Gcc
Message-ID: <bf61e79a0607271245t6b8408a2hdf1341532fac4c5e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don,

> warning: dereferencing type-punned pointer will break strict-aliasing rules

I followed Rob Landley's suggestion and removed -Werror from
Rules.mak.  This allowed me to  build a root filesystem using gcc
version 3.4.5 20051201 (Red Hat 3.4.5-2).

Best,

Drew
