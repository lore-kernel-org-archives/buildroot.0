From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 24 Sep 2019 23:07:30 -0300
Subject: [Buildroot] [PATCH 04/18] checkpackagelib/lib_config.py:
 CommentsMenusPackagesOrder: add functions to initialize arrays elements
References: <20190903211341.10341-4-jerzy.m.grzegorek@gmail.com>
Message-ID: <5d8acbe2c087c_9193fde20154724443c9@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Sep 03, 2019 at 06:13 PM, Jerzy Grzegorek wrote:

> checkpackagelib/lib_config.py: CommentsMenusPackagesOrder: add functions to initialize arrays elements

This subject is long, but I don't have a good replacement to suggest.

Perhaps a commit message like this would be good:
Factor out two functions to initialize arrays elements. They will be
reused by followup patches.

> Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

With some improvement to the commit message (not necessarily what I
wrote):
 Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Regards,
Ricardo
