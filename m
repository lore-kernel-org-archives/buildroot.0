From: Jens <irimi@gmx.de>
Date: Tue, 19 Jan 2010 23:35:59 +0100
Subject: [Buildroot] toolchain problem:wrong path in libSDL.la
In-Reply-To: <4B55FFC2.3010800@free.fr>
References: <4B55DEAF.40808@gmx.de> <4B55FFC2.3010800@free.fr>
Message-ID: <4B5633CF.3000605@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

Thank you very much! Yes in staging_dir libdir of libSDL.a has fixed now.
But your patch is just a workaround because in build dir of SDL the path 
will be still wrong.

Could not find it as known bug in recent buglist, hence I supposed to 
write a new bug report, but I still don't have an account.

BR,
Jens

Julien Boibessot wrote:
> Hi Jens,
>
> Jens a ?crit :
>   
>> I'm using recent version 2009.11 and I've added SDL package to my
>> configuration.
>>
>> My br installation is at /mnt/ext3data/buildroot/
>>
>> but br creates a wrong path of libdir in libSDL.la
>>     
> please find attached here a patch that can probably solve your problem.
> Sorry but I didn't take time yet to submit it to BR team.
> http://armadeus.git.sourceforge.net/git/gitweb.cgi?p=armadeus/armadeus;a=blob;f=patches/buildroot/078-sdl-correct_libdir_path_in_libSDL.la.patch;h=c455834241d222b72865032c333c83630bd571b0;hb=HEAD
>
> Hope it will help you...
>
> Regards,
> Julien
>
>   

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100119/d14a3ecf/attachment-0001.htm>
