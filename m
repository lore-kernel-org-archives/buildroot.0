From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 24 Sep 2019 23:13:30 -0300
Subject: [Buildroot] [PATCH 00/18] Improve alphabetical order checking
 of Config.in files
References: <20190903210351.9997-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <5d8acd4a4634f_9193fde20108ba8447be@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thank you for working on this.

On Tue, Sep 03, 2019 at 06:03 PM, Jerzy Grzegorek wrote:

> The main purpose of this patch series is to improve alphabetical order
> checking of comments, menus and packages in Config.in files.
> Patches 1-11 are preliminary ones and add small improvements.

> Patches 12, 14, 15 do the main work.
> Patches 13, 16-18 fix issues in  Config.in files.

I completely understand why you developed the patches in this order.
But usually when applying changes in the script that imply fixes/changes in
other files, we do apply the other way around. First fixes, then the script
that detect the error just corrected.

> 
> Jerzy Grzegorek (18):
>   checkpackagelib/lib_config.py: CommentsMenusPackagesOrder: rename
>     variable 'm'

Here and in many more patches I guess a better prefix for the subject would be:
utils/checkpackagelib:


Regards,
Ricardo
