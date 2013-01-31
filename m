From: Gerald <gerald.radix@gmail.com>
Date: Thu, 31 Jan 2013 10:53:26 +0100
Subject: [Buildroot] Pandaboard ethernet
In-Reply-To: <CAAfyv35nz3YqwTOK905zKGR9zBMUUo-yjX4coiJ9UZCTAGeMPw@mail.gmail.com>
References: <510A2BC5.6000905@gmail.com>	<CAGm1_kso1_L721ApeLnq2rhCGb5UQvr9cCp3ELS4qHFGBhJ90A@mail.gmail.com>
 <CAAfyv35nz3YqwTOK905zKGR9zBMUUo-yjX4coiJ9UZCTAGeMPw@mail.gmail.com>
Message-ID: <510A3F16.4000400@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CONFIG_USB_NET_SMSC95XX=y in output/build/linux-3.6.8

and the network works if i use ubuntu distrib...



Le 31/01/2013 09:52, Belisko Marek a ?crit :
> On Thu, Jan 31, 2013 at 9:43 AM, Yegor Yefremov
> <yegorslists@googlemail.com>  wrote:
>    
>> On Thu, Jan 31, 2013 at 9:31 AM, Gerald<gerald.radix@gmail.com>  wrote:
>>      
>>> With Buildroot 2011.11.1, i use the  setting of pandaboard config, but i
>>> have no ethernet :
>>>
>>> ifconfig eth0 up :
>>> SIOCGIFFLAGS: No such device.
>>>
>>> What is the driver of ethernet pandaboard and how-to use it ?
>>>        
>> Just activate CONFIG_USB_NET_SMSC95XX and then post output of ifconfig:
>>      
> Hmm BT 2011.1.1 using kernel 3.6.8 and in omap2plus_defconfig is in
> this veriosion:
> CONFIG_USB_NET_SMSC95XX=y so it should be enabled. Maybe HW problem?
>    
>> ifconfig -a
>>
>> Yegor
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>      
> Cheers,
>
> mbe
>
>    
