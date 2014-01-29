From: Mau Z <zmau1962@gmail.com>
Date: Wed, 29 Jan 2014 12:06:15 +0200
Subject: [Buildroot] How to add openGL library ?
In-Reply-To: <CAPFcPT+E_NF7fZCFfnPaDhbGYYo038bBuSJcZPMBoVH=JCAerw@mail.gmail.com>
References: <CAPFcPTLna9_Z3A+DTHNH18u8GUSzPTBJjOTiO5kaxf6wgGw1ag@mail.gmail.com>
 <CAPFcPT+E_NF7fZCFfnPaDhbGYYo038bBuSJcZPMBoVH=JCAerw@mail.gmail.com>
Message-ID: <CAPFcPTLyvfSYifFNQjWXggqLSE75-kyZw7ejmUDj=B=hcL1EOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,


Thanks for answering.

Mesa3d is probably good.


I have no idea as to how to implement the patch that you had sent me  :-(

I am working with buildroot 2013.11

BTW, eventually it would have to be built with the external toolchain
(Sourcery CodeBench).



Thanks

Mau

========================================================================

>* My system is Intel i7 based.
*>* As mentioned above, I need openGL in order to access the GPU.
*
Hi,

does Mesa3D meet your
requirements?http://www.phoronix.com/scan.php?page=news_item&px=MTQ4MzI

If yes, have a look at this patch:http://patchwork.ozlabs.org/patch/309540/

Regards, Bernd




On Mon, Jan 27, 2014 at 8:36 PM, Mau Z <zmau1962@gmail.com> wrote:

> Hi again,
>
> Looking at the following link I understand that I need to give some more
> information  (http://free-electrons.com/blog/buildroot-2013-05/).
>
> My system is Intel i7 based.
> As mentioned above, I need openGL in order to access the GPU.
> I understand that it does not exist for this platform. Correct ?
>
> Thomas Petazzoni says "We intend to add more in the future, but we also
> welcome contributions in this area".
> What should I do in order to have support for this platform ?    When it
> is over I will ask how do I make the contribution.
>
>
> Thanks
> Mau
>
>
>
> On Mon, Jan 27, 2014 at 8:24 PM, Mau Z <zmau1962@gmail.com> wrote:
>
>> Hi!
>>
>> I am using buildroot 11.2013.
>> I have an application which uses the i7 GPU via openGL. The system itself
>> does not have a display.
>> I am unable find how do I include openGL.
>>
>> Any advice ?
>>
>>
>> Thanks
>> Mau
>>
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140129/74c02bc9/attachment.html>
