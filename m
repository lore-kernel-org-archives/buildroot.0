From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jun 2015 23:28:50 +0200
Subject: [Buildroot] New makedevs.c which can now handle users/groups
 created via FOO_USERS
In-Reply-To: <CACiQJzwO=snzcFXDJY7-eJ==dd7tcGrkvBahksHTv7UmfO_ZLA@mail.gmail.com>
References: <CACiQJzwO=snzcFXDJY7-eJ==dd7tcGrkvBahksHTv7UmfO_ZLA@mail.gmail.com>
Message-ID: <20150608232850.017e1915@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonathan,

On Mon, 8 Jun 2015 16:39:59 -0400, Jonathan Boivin wrote:

> This new version is useful when a package create new users via
> FOO_USERS and want to use the username newly created into
> FOO_PERMISSIONS.
> 
> http://pastebin.com/UK5WDm7X

Thanks. However, this is not the proper way of doing a patch submission
to Buildroot. See
http://buildroot.org/downloads/manual/manual.html#submitting-patches
for details on how to do a proper patch submission.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
