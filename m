From: Chetan Kumar <shivakumar.chetan@gmail.com>
Date: Wed, 10 Aug 2016 22:22:54 +0530
Subject: [Buildroot] raspberry-pi3 do not work on buildroot-2016.05.
In-Reply-To: <CAMWiJUu=8CggiQZp3gRC_nyV1DsXFr7JrE6SqdeMhewtZmsRXQ@mail.gmail.com>
References: <6fa04b57-f1c2-b96a-dfc5-fb19679b4f3d@cox.net>
 <CAMWiJUu=8CggiQZp3gRC_nyV1DsXFr7JrE6SqdeMhewtZmsRXQ@mail.gmail.com>
Message-ID: <CAFN-Ez4R28+7pf_HsURo+0q9EimKM_4ZPqosSfjf9RisbtqhZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Zhaozhou,

That did not work in my case. Also this IMO, is not mandatory, in my case,
random is initialized (the message say)..

Thanks
C

On Wed, Aug 10, 2016 at 9:53 PM, Zhaozhou Meng <mengzhaozhou@gmail.com>
wrote:

> Hi,
>
> I had the same problems on my board imx6, but it just need to type the
> keyboard and the login prompt display.
>
>
> Regards,
> Zhaozhou
>
> 2016-08-10 17:27 GMT+02:00 Chris Sparks <mr_ada@cox.net>:
>
>> Same here, I'll have to try that version.  Thanks.
>>
>> chris
>>
>> Comrades,
>>
>> I used raspberrypi3_defconfig on buildroot-2016.05 loaded the sdcard.img
>> onto my raspberrypi-3, boots but get stuck at
>> random: nonblocking pool is initialized
>>
>> Tried same on buildroot-2016.08-rc1, it just works and get the login
>> prompt.
>>
>> Any clue ?
>>
>>
>> Thanks
>> C
>>
>>
>> _______________________________________________
>> buildroot mailing listbuildroot at busybox.nethttp://lists.busybox.net/mailman/listinfo/buildroot
>>
>>
>>
>>
>> <https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=emailclient&utm_term=icon> Virus-free.
>> www.avast.com
>> <https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=emailclient&utm_term=link>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160810/a0ac42a3/attachment.html>
