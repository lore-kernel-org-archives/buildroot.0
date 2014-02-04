From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Feb 2014 09:06:27 +0100
Subject: [Buildroot] [PATCH 2/2] mysql: disable debugging option
In-Reply-To: <CA+kK6WueuafTab1brxw-DakS7JBFM8hMgfoDtm9Z_-PTsv_xuw@mail.gmail.com>
References: <52efff31.0902ec0a.7f04.45f7@mx.google.com>
 <20140203225237.6c503ed7@skate>
 <CA+kK6WueuafTab1brxw-DakS7JBFM8hMgfoDtm9Z_-PTsv_xuw@mail.gmail.com>
Message-ID: <20140204090627.6c705a85@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marcelo Gutierrez,

On Mon, 3 Feb 2014 21:03:10 -0200, Marcelo Gutierrez wrote:

> When you use --without-server option, there is no debugging log, because
> will work only when MySQL server is enabled.
> 
> MySQL 5.1 Reference Manual:
> http://dev.mysql.com/doc/refman/5.1/en/debugging-server.html

Ok.

> No, not necessarily. ENABLE_DEBUG is a global variable that contains
> > --enable-debug if BR2_ENABLE_DEBUG is enabled, or is empty otherwise.
> > See: http://git.buildroot.net/buildroot/tree/package/Makefile.in#n357.
> >
> 
> To configure MySQL with debugging code, we need to use the
> --with-debugoption. But right now we only compile MySQL client, so
> that option it's not
> necessary.

Ok. Can you resend your patch with an updated commit log that explains
this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
