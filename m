From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 03 Oct 2019 23:28:17 -0300
Subject: [Buildroot] [PATCH 09/18] checkpackagelib/lib_config.py:
 CommentsMenusPackagesOrder: drop function get_line
References: <20190903211341.10341-9-jerzy.m.grzegorek@gmail.com>
Message-ID: <5d96ae418b62_5fe63f84701273c819115@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Sep 03, 2019 at 06:13 PM, Jerzy Grzegorek wrote:

> Because function get_line() has only one line so use it inline.

IMO it was better before this patch, so I would drop it, but if your patch
convince a maintainer, I am OK too.
So I will not give a tag, but it is not incorrect.


Regards,
Ricardo
