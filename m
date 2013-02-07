From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 07 Feb 2013 23:40:41 +0100
Subject: [Buildroot] [PATCH 3/5] qt: define license
In-Reply-To: <5113DE02.3080308@mind.be>
References: <1360167853-7177-1-git-send-email-luca@lucaceresoli.net>
 <1360167853-7177-3-git-send-email-luca@lucaceresoli.net>
 <20130206175833.6c382929@skate> <5112B733.6090103@mind.be>
 <5113672E.4030300@lucaceresoli.net> <5113DE02.3080308@mind.be>
Message-ID: <51142D69.10008@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle wrote:
>> How about the following?
>>
>> QT_LICENSE = LGPLv2.1 with exceptions or GPLv3
>> ifneq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
>> QT_LICENSE += or Digia Qt Commercial license
>> endif
>> QT_LICENSE_FILES = LICENSE.LGPL LGPL_EXCEPTION.txt LICENSE.GPL3
>
>   Sounds good to me.
>
>
>> This way we still cannot automatically (and safely) set
>> _REDISTRIBUTE = NO, unless we add an explicit "Use commercial license"
>> knob in menuconfig.
>
>   I don't think that's very important.

I agree. In fact I did not care about this in the v2 patch I just sent.

Luca
