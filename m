From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 03 Oct 2014 16:28:40 +0200
Subject: [Buildroot] [PATCH 01/11] mesa3d: Fix package requirements
References: <1412340212-3089-1-git-send-email-jezz@sysmic.org>
 <1412340212-3089-2-git-send-email-jezz@sysmic.org>
 <XnsA3BB97440D8C9berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <3045501.26YYGqRTnd@sagittea>
Message-ID: <XnsA3BBA79E6C155berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me Pouiller <jezz@sysmic.org> wrote in
news:3045501.26YYGqRTnd at sagittea: 

> I encountered problems with dri3 dependencies during my tests. By
> checking code more closely, my problems happens only if no DRI was
> selected. I will fix that. 
> 

Hi,

did you test with latest buildroot git master?
It includes this patch which should fix the problem:

http://git.buildroot.net/buildroot/commit/package/mesa3d/mesa3d.mk?
id=d0edceb9d4e9ba6536af5b6687e8523f1c5ea5d1

If it does not fix the problem please post the error message.

Regards, Bernd
