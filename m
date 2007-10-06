From: <bogus@does.not.exist.com>
Date: Sat, 06 Oct 2007 20:13:59 -0000
Subject: No subject
Message-ID: <mailman.1.1195232520.1105.buildroot@uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

May be strace does not provide correct output?

Regards,
Ivan

ing. Federico Fuga wrote:
> Hi Ivan,
> 
> which kernel version and kernel headers are you using? Mine are 2.6.23.1
> and 2.6.23, but now I am trying to move the kernel headers to 2.6.21
> (Angstrom  linux works without problems, but are based on different
> kernel headers).
> uclibc I am using are 0.9.29, alsa 1.0.14.
> The failing ioctl is identical both in the working (Angstrom) and not
> working versions, and since the kernel is the same (really the same!) I
> am thinking that is only a problem between the "glue" of uclibc and
> kernel...
> I'll keep you informed.
> 
> Regards,
> 
> ing. Federico Fuga
> 
> Ivan Kuten ha scritto:
>> Hi Federico!
>>
>> I'm observing the same problem with ALSA as you.
>>
>>   
>>> ioctl(4, USBDEVFS_CONTROL, 0xbef809cc)  = 0
>>> ioctl(4, UI_DEV_CREATE, 0xbef80ab0)     = 0
>>> ioctl(4, USBDEVFS_CONNECTINFO, 0xbef80634) = 0
>>> ioctl(4, USBDEVFS_HUB_PORTINFO, 0xbef80748) = -1 ENOTTY (Inappropriate
>>> ioctl for device)
>>>     
>> Think these lines are key to understanding what the problem is.
>>
>> Regards,
>> Ivan
>>
>>
>>   
> 


--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
