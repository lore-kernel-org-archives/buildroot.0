From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 24 Sep 2019 23:08:41 -0300
Subject: [Buildroot] [PATCH 05/18] checkpackagelib/lib_config.py:
 CommentsMenusPackagesOrder: change the type of variable 'new_package'
References: <20190903211341.10341-5-jerzy.m.grzegorek@gmail.com>
Message-ID: <5d8acc291f697_9193fde2012b3d8445c9@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Sep 03, 2019 at 06:13 PM, Jerzy Grzegorek wrote:

> Change the type of variable 'new_package' to make it a class member.
> It will be used not only locally.
> Also initialize it.
> 
> Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

In this patch you correctly did the initialization I talked about in the
review to patch 2.


Regards,
Ricardo
