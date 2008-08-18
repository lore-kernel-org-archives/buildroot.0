From: Daniel Endres <d.endres@meteocontrol.de>
Date: Mon, 18 Aug 2008 19:02:40 +0200
Subject: [Buildroot] Error during make
In-Reply-To: <20080813145843.GA9471@mx.loc>
References: <48A2F37B.6060308@meteocontrol.de> <20080813145843.GA9471@mx.loc>
Message-ID: <48A9AB30.8080904@meteocontrol.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernhard,

first of all, thanks for your quick reply.
Ok, missing libm functionaliy seems to be the problem. But how do I 
configure my libc-library? You did mean "configure your uclibc" didn't you?

I've tried to configure my uclibc as stated in the docs/Readme via "make 
uclibc-menuconfig", but there isn't any possibility to configure libm 
support?

Am I digging in  the wrong spot ?

Thanks for your help

Greetings, Daniel
> On Wed, Aug 13, 2008 at 04:45:15PM +0200, Daniel Endres wrote:
>   
>> Hello Guys,
>>
>> I'm trying to build a toolchain as well as rootfs for a mipsel device.
>>
>> Therefore I'd like to use buildroot. The problem is that I'm getting
>> some undefined references errors during the awk-build. Obviously the
>> errors are due to a missing math-library.
>>
>> I've just downloaded the latest snapshot in the first place and tried
>> the svn-version later on.
>> Both giving me the same errors.
>>
>> I've just done a "make menuconfig" for buildroot, changed the target to
>> mipsel, exited and hit "make".
>> I don't know if I'm wrong, but shouldn't a clean build succeed ?
>>
>> Below I've posted my error-log. Hopefully some could point me in the
>> right direction.
>>     
>
> Well, as you correctly state you need stuff from libm, so configure your
> libc to provide the required libm functionality.
>
> see docs/README
>
>   

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080818/387f4810/attachment.htm 
