From: Jinag Robert <cretaceousstone@yahoo.com.cn>
Date: Wed, 1 Aug 2007 15:42:18 +0800 (CST)
Subject: [Buildroot] How to just build one application?
Message-ID: <909390.29092.qm@web15810.mail.cnb.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm building smaba following your instructions now. 

Thanks.
Robert

----- Original Message ----
From: Ulf Samuelsson <ulf@atmel.com>
To: Jinag Robert <cretaceousstone@yahoo.com.cn>; Philippe Ney <philippe.ney@tizoo.com>; buildroot at uclibc.org
Sent: Wednesday, August 1, 2007 1:17:56 PM
Subject: Re: [Buildroot] How to just build one application?

>>> I've installed  arm linux gcc 4.1.1 toolchains and I want to build uclibc samba with buildroot package. 
>>> How can I skip building toolchains and just build samba package with the pre-installed toolchains ?
>> 
>> $ make samba
>> 
>> You can build any target that is defined in a *.mk file by passing it
>> directly to the make call.
>> 
>> Philippe
>
>I added "sambe" with make menuconfig and then issued "make samba". But the build script still build gcc tool chain first.  
> 

There is a menu configuration item:
    Toolchain type --->
        Toolchain type (External Toolchain)

Then you need to set the paths in the
    Toolchain Options --->


Best Regards
Ulf Samuelsson






      ____________________________________________________________________________________
Luggage? GPS? Comic books? 
Check out fitting gifts for grads at Yahoo! Search
http://search.yahoo.com/search?fr=oni_on_mail&p=graduation+gifts&cs=bz
