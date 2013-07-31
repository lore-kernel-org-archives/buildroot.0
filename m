From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 11:10:55 +0200
Subject: [Buildroot] [PATCH] pacakge : add trace-cmd package
In-Reply-To: <CACszssV7-euO7F7HcqBxQf8nzj_hDit8+oW=T7TcQsF4c4pXjw@mail.gmail.com>
References: <p.floury@gmail.com>
 <1375192983-29277-1-git-send-email-p.floury@gmail.com>
 <CAAXf6LW95FOYZ69myDTfhQz7hHPXhix7aZTMsg77YAA25yi5AQ@mail.gmail.com>
 <CACszssV7-euO7F7HcqBxQf8nzj_hDit8+oW=T7TcQsF4c4pXjw@mail.gmail.com>
Message-ID: <20130731111055.23cfc2ef@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear pierre,

On Wed, 31 Jul 2013 10:56:00 +0200, pierre wrote:

> Concerning the work flow, I sent the first patch via "git send-email",
> which was a bit laconic.. Is it ok if I just attach the patch file to a
> "regular" email ?

No, the new version should again been sent with git send-email, with a
different subject name, such as '[PATCH v2] trace-cmd: new package',
and a changelog of the differences between v1 and v2, like:

trace-cmd: new package

This commit adds a new package for the trace-cmd tool, which does...
blabla blabla.

Signed-off-by: ....
---
Changes since v1:
 - this
 - that

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
