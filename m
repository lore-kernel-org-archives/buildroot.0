From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 03 Oct 2019 23:27:03 -0300
Subject: [Buildroot] [PATCH 06/18] checkpackagelib/lib_config.py:
 CommentsMenusPackagesOrder: remove '-comment' state before the '-menu' one
References: <20190903211341.10341-6-jerzy.m.grzegorek@gmail.com>
Message-ID: <5d96adf71764c_5fe63f84701ac050187a4@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Sep 03, 2019 at 06:13 PM, Jerzy Grzegorek wrote:

If you resend, please use prefix:
utils/checkpackagelib:

> The comment may contain packages or if-endif block(s) but not menu(s)
> of packages, so lets remove the '-comment' state before the '-menu' one.
> 
> Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

With the prefix fixed:
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>


Regards,
Ricardo
