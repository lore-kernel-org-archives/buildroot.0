From: C.A, Subramaniam <subramaniam.ca@ti.com>
Date: Fri, 16 Sep 2011 12:18:16 -0500
Subject: [Buildroot] CodeSourcery moved to Mentor Graphics
In-Reply-To: <4E731EBD.9020807@xor-gate.org>
References: <4E6F323A.1080605@xor-gate.org>
 <201109131251.21570.yann.morin.1998@anciens.enib.fr>
 <87fwk04r16.fsf@macbook.be.48ers.dk>
 <4E731EBD.9020807@xor-gate.org>
Message-ID: <CAPCu-pQxSuZ_aS9NZdSTdx+4=2qsUrd4ov+sXXrhE=GpoquP7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 16, 2011 at 5:02 AM, Jerry Jacobs <jerry@xor-gate.org> wrote:
> It seems to be fixed for me,
Peter got in touch with the Mentor guys and they fixed the re-direction.
>
> Kind regards,
> Jerry
>
> On 9/13/11 1:31 PM, Peter Korsgaard wrote:
>>>>>>>
>>>>>>> "Yann" == Yann E MORIN<yann.morin.1998@anciens.enib.fr> ?writes:
>>
>> ?Yann> ?Jerry, All,
>> ?Yann> ?On Tuesday 13 September 2011 12:36:42 Jerry Jacobs wrote:
>> ?>> ?I tried to create a new configuration for the Ledato NanosG20
>> ?>> ?(AT91SAM9G20) with the codesourcery toolchain. But it was not able to
>> ?>> ?download the toolchain (Using latest buildroot from GIT).
>>
>> ?Yann> ?The issue has been reported to Mentor Graphics by Peter, and it
>> seems they
>> ?Yann> ?have fixed the issue, as reported by Peter:
>> ?Yann>
>> ?http://lists.busybox.net/pipermail/buildroot/2011-September/045580.html
>>
>> ?Yann> ?I'll check here, but if it still breaks for you, just say so.
>>
>> Indeed, it should be fixed now (also for older Buildroot releases), so
>> please try again:
>>
>> --2011-09-13 13:30:29--
>> ?http://www.codesourcery.com/sgpp/lite/arm/portal/package6488/public/arm-none-linux-gnueabi//arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
>> Resolving www.codesourcery.com (www.codesourcery.com)... 174.129.20.178
>> Connecting to www.codesourcery.com
>> (www.codesourcery.com)|174.129.20.178|:80... connected.
>> HTTP request sent, awaiting response... 301 Moved Permanently
>> Location:
>> https://sourcery.mentor.com/sgpp/lite/arm/portal/package6488/public/arm-none-linux-gnueabi//arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
>> [following]
>> --2011-09-13 13:30:29--
>> ?https://sourcery.mentor.com/sgpp/lite/arm/portal/package6488/public/arm-none-linux-gnueabi//arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
>> Resolving sourcery.mentor.com (sourcery.mentor.com)... 107.20.212.105
>> Connecting to sourcery.mentor.com
>> (sourcery.mentor.com)|107.20.212.105|:443... connected.
>> HTTP request sent, awaiting response... 302 Found
>> Location:
>> https://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi//arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
>> [following]
>> --2011-09-13 13:30:35--
>> ?https://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi//arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
>> Connecting to sourcery.mentor.com
>> (sourcery.mentor.com)|107.20.212.105|:443... connected.
>> HTTP request sent, awaiting response... 200 OK
>> Length: 82460512 (79M) [application/x-bzip2]
>> Saving to:
>> `/var/lib/downloads/arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2'
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 

Thank you and Regards
Subbu
