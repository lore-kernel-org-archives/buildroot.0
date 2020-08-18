From: Avraham Shukron <avraham.shukron@gmail.com>
Date: Tue, 18 Aug 2020 20:26:28 +0300
Subject: [Buildroot] [Question] How to depend on a feature in libc
Message-ID: <CAJX3zAvDehsPYF_kQSOT5xeynDYn_q=M64vBKueLvWtKmnymQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all!

I want to add a package that has an optional feature that requires the
<fenv.h> header from C99.
Apparently, this module is optional in uClibc, and it is not included in
the default config.

I want my package's Config.in file to define a boolean config entry
that depends on
whether or not the selected libc has <fenv.h>.

How can I do that?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200818/a57c4c10/attachment.html>
