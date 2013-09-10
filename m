From: =?UTF-8?B?UGV0ZXIgS8O8bW1lbA==?= <syntheticpp@gmx.net>
Date: Tue, 10 Sep 2013 21:53:08 +0200
Subject: [Buildroot] backtrace() depth
In-Reply-To: <CAHXCMMLoHUQSjzgPpubAXvYGFw=dmWDPShVKBsOx3KWLPCmUtA@mail.gmail.com>
References: <522F708E.2070004@gmx.net>
 <CAHXCMMLoHUQSjzgPpubAXvYGFw=dmWDPShVKBsOx3KWLPCmUtA@mail.gmail.com>
Message-ID: <522F78A4.6040907@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> Is the strip command set to none (under the "Build options" menu)?
> if not, then you should certainly added the binaries you are debgging to the
> BR2_STRIP_EXCLUDE_FILES or  BR2_STRIP_EXCLUDE_DIRS lists.

Hi Samuel,

I even selected sstrip for the compiler and rootfs, but the the application
itself is not stripped, it's not build by buildroot.
Does the bt stop at the first stripped lib it reaches?

Peter
