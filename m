From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 24 Sep 2019 23:14:55 -0300
Subject: [Buildroot] [PATCH 14/18] checkpackagelib/lib_config.py:
 CommentsMenusPackagesOrder: check the order of comments menu
References: <20190903211341.10341-14-jerzy.m.grzegorek@gmail.com>
Message-ID: <5d8acd9f177d3_9193fde200d599c44950@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Sep 03, 2019 at 06:13 PM, Jerzy Grzegorek wrote:

[snip]
> +++ b/utils/checkpackagelib/lib_config.py
> @@ -61,6 +61,10 @@ class AttributesOrder(_CheckFunction):
>  
>  
>  class CommentsMenusPackagesOrder(_CheckFunction):
> +    comment = [""]
> +    comments_order_checking = [False]
> +    print_comment_warning = [True]

This is not good. Please use instance variables initialized in before().
See my comment on the next patch.


Regards,
Ricardo
