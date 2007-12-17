From: Marco <developement333@gmx.net>
Date: Mon, 17 Dec 2007 17:56:07 +0100
Subject: [Buildroot] buildroot ARM, error during make / make source
In-Reply-To: <4766B7F6.8080104@promwad.com>
References: <4766A681.2010803@gmx.net> <4766B7F6.8080104@promwad.com>
Message-ID: <4766AA27.2000204@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gnah, stupid error. thanx. that does it. saw your mail but, as i am lil
bit new to this whole stuff, i dont recognized the relevance.
cheers
marco

Ivan Kuten schrieb:
> Marco wrote:
>   
>> hello list,
>>
>> obviously there is a problem with the receiving files example:
>>
>> wget --passive-ftp  -P /mnt/svn/buildroot/dl /ed//ed-0.8.tar.bz2
>> /ed//ed-0.8.tar.bz2: Nicht unterst??tztes Schema.
>>
>> same happened also to gdb
>> ciao marco
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
>>     
>
> Try to check in your config:
> BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
> BR2_GNU_MIRROR="http://ftp.gnu.org"
>
> I made a commit today introducing mirrors for KERNEL and GNU packages
> May be you need to adjust your config.
>
>
>
> Regards,
> Ivan
> --------------------------------
> Embedded Linux engineer,
> Promwad Company: http://www.promwad.com/
> Homepage : http://www.ivankuten.com/
> --------------------------------
>
>   
