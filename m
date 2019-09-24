From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 23 Sep 2019 23:32:37 -0300
Subject: [Buildroot] [PATCH 01/18] checkpackagelib/lib_config.py:
 CommentsMenusPackagesOrder: rename variable 'm'
References: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <5d8980455d450_48b93fa5cc172d004683a@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Sep 03, 2019 at 06:13 PM, Jerzy Grzegorek wrote:

> checkpackagelib/lib_config.py: CommentsMenusPackagesOrder: rename variable 'm'

I guess a better prefix would be:
utils/checkpackagelib: CommentsMenusPackagesOrder: rename variable 'm'
Since it is a minor nit, I give my tag below and the maintainer who applies
this patch can decide to change or not.

> 
> Rename variable 'm' for better readability.
> 
> Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Regards,
Ricardo
