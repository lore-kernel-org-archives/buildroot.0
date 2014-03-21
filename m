From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 21 Mar 2014 17:45:52 +0100
Subject: [Buildroot] [PATCH v4] bluez5_utils: new package
In-Reply-To: <532C25A2.90907@zacarias.com.ar>
References: <532B4158.6070602@trzebnica.net>
 <1395395632-15685-1-git-send-email-marcin@bis.org.pl>
 <532C1D9A.8090109@trzebnica.net> <532C25A2.90907@zacarias.com.ar>
Message-ID: <532C6CC0.4070608@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Gustavo,

> On 03/21/2014 08:08 AM, Jerzy Grzegorek wrote:
>
>>> --- a/package/Config.in
>>> +++ b/package/Config.in
>>> @@ -867,6 +867,7 @@ source "package/axel/Config.in"
>>>    source "package/bcusdk/Config.in"
>>>    source "package/bind/Config.in"
>>>    source "package/bluez_utils/Config.in"
>>> +source "package/bluez5_utils/Config.in"
>> Add it in alphabetical order.
> Hmm? bluez5 > bluez, and we care about visual name there (how it shows
> up in *config).

Don't compare bluez5 with bluez.
Compare bluez5_utils with bluez_utils.

Regards,
Jerzy

> Regards.
>
>
