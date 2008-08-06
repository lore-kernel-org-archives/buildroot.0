From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 6 Aug 2008 18:37:51 +0200
Subject: [Buildroot] C double type problem - at91sam9263
References: <223E6519BDCAC74695BEE9D163F8E6592306FB@oakleaf10.oakleafconsultancy.com>
Message-ID: <A7FA8ABAD28A4E6F9176EEE9FC4C1341@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Is it possible that gcc 4.2.1 is a very buggy compiler version? Can
> anyone suggest whether I might be better to try another version (ideally
> one that Buildroot supports), and if so, which one?

Try using -O2.
Somewhere in a remote part of my brain it says that
you want this for the kernel.
Maybe applications are affected as well.

Best Regards
Ulf Samuelsson


Thanks again,
Richard.
