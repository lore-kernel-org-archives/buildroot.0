From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 26 Jan 2021 10:48:29 +0200
Subject: [Buildroot] Porting a vendor specific yocto layer to the
 buildroot
In-Reply-To: <CAGF7ZoZ8MUBbEB=6gXOCCSPNFJcF_Kva=XQducEx_u+O0EeATg@mail.gmail.com>
References: <1611562430908-0.post@n4.nabble.com>
 <877do07r4c.fsf@dell.be.48ers.dk>
 <CAGF7ZoZ8MUBbEB=6gXOCCSPNFJcF_Kva=XQducEx_u+O0EeATg@mail.gmail.com>
Message-ID: <878s8gccde.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi scd,

On Mon, Jan 25 2021, scd rjcom wrote:
> Thank you!  I understand that the vendor specific layers have their own
> packages and customizations.
>
> I was looking for some generic guidelines to perform this. (Assuming that
> all the packages are open source)
>
> It would be great if buildroot documentation will provide some guidelines
> to perform the porting of the Yocto layers to Buildroot.

Not exactly what you are asking, but these might help you anyway:

  https://elinux.org/images/9/9a/Buildroot-vs-Yocto-Differences-for-Your-Daily-Job-Luca-Ceresoli-AIM-Sportline.pdf
  https://youtu.be/wCVYQWFIvBs

Thanks to Luca.

baruch

> On Mon, Jan 25, 2021 at 11:28 AM Peter Korsgaard <peter@korsgaard.com>
> wrote:
>
>> >>>>> "scdrj" == scdrj  <scdrjcom@gmail.com> writes:
>>
>>  > How do I port a vendor specific yocto layer to the buildroot?
>>
>> One step at a time?
>>
>> No seriously, it is hard to know without knowing what that layer
>> does. You will need to have a look at everything it does and add
>> packages and rootfs overlays / post-build scripts to do the same thing
>> in Buildroot.
>>
>> --
>> Bye, Peter Korsgaard
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
