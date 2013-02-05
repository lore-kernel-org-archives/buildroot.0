From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Feb 2013 08:45:02 +0100
Subject: [Buildroot] bug report: c++ programs built by toolchain crash
 by seg fault
In-Reply-To: <CAJXWAwwHVddYF3StQByTW99aCDksiAwyOa_WdM7AbjGu3i6iJg@mail.gmail.com>
References: <CAJXWAwwHVddYF3StQByTW99aCDksiAwyOa_WdM7AbjGu3i6iJg@mail.gmail.com>
Message-ID: <20130205084502.6b370422@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear hayate,

On Tue, 5 Feb 2013 14:24:55 +0800, hayate wrote:

> arm little endian; generic arm; OABI; gcc 4.6.3 with c++ support;
> uclibc 0.9.31.1

Can you test with EABI?

Really OABI is deprecated. It would not be surprising at all that there
are issues with OABI.

Do you have a compelling reason to stick with OABI if you are making a
new toolchain?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
