From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Dec 2016 17:50:50 +0100
Subject: [Buildroot] Aid for buildroot compilation
In-Reply-To: <CABLXdK8G7SH+Zy88hLguJ0WqEOQE-h9MaG_8rQwzHQNeTyVK9Q@mail.gmail.com>
References: <CABLXdK8G7SH+Zy88hLguJ0WqEOQE-h9MaG_8rQwzHQNeTyVK9Q@mail.gmail.com>
Message-ID: <20161230175050.0b3bf0f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Dec 2016 13:00:14 +0100, Ricardo Herrero wrote:

> *In file included from img2srec.c:55:0:*
> *os_support.h:22:22: fatal error: compiler.h: No such file or directory*
> * #include "compiler.h"*

I suspect you're trying to build a too old version of U-Boot with a too
recent host gcc version (like 5.x).

> If you want I can send the .config file

Yes, please. However, make sure that we can actually build it,
especially make sure that we have access to the U-Boot source code. If
we can't access it, then there isn't much we can do besides give the
above potential explanation.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
