From: Brad House <brad@mainstreetsoftworks.com>
Date: Sat, 11 Aug 2007 09:18:05 -0400
Subject: [Buildroot] [patch] udev broken, update and fix
In-Reply-To: <46B8E85F.2040909@mainstreetsoftworks.com>
References: <46B7BE61.5060107@mainstreetsoftworks.com>	<022001c7d939$a7eb56d0$dcc4af0a@atmel.com>
	<46B8E85F.2040909@mainstreetsoftworks.com>
Message-ID: <46BDB70D.20202@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Any word on getting this committed?

Thanks.
-Brad

Brad House wrote:
>> If you build udev, and then delete the source directory, and build
>> udev again
>> you will get multiple lines "udev_root=/dev" in the udev.conf.
>>
>> It would be better to check if it is there and add it, if it is not.
> 
> Yep, you're right. I've attached a patch to fix that.
> I also fixed the udev-clean/dirclean issue if you didn't have
> volume_id and scsi_id selected.
> 
> -Brad
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
