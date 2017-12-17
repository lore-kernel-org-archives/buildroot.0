From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Mon, 18 Dec 2017 00:13:48 +0100
Subject: [Buildroot] [PATCH 1/1] package: remove the default value of
 the $(PKG)_SOURCE variable
In-Reply-To: <20171217120406.3c63fe83@windsurf>
References: <1513506292-27032-1-git-send-email-jerzy.m.grzegorek@gmail.com>
 <20171217120406.3c63fe83@windsurf>
Message-ID: <3130a2bd-3863-7cd7-6a53-f7b2fcc1eaa3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> Hello,
>
> On Sun, 17 Dec 2017 11:24:52 +0100, Jerzy Grzegorek wrote:
>> Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
>> ---
>>   package/pimd/pimd.mk                                   | 1 -
>>   package/proj/proj.mk                                   | 1 -
>>   package/traceroute/traceroute.mk                       | 1 -
>>   3 files changed, 3 deletions(-)
> Applied to master, thanks. In order to avoid such mistakes in the
> future, would you be willing to contribute an addition to the
> check-package script that detects usage of the default <pkg>_SOURCE
> value ?

Sure, I'll try to do it.

Regards,
Jerzy

>
> Thanks!
>
> Thomas
