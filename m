From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 17 Mar 2011 14:57:42 -0700
Subject: [Buildroot] glibc vs uclibc
In-Reply-To: <AANLkTimCeg_s5o7th-20cd77045CVrRAFowKwt8COXLa@mail.gmail.com>
References: <AANLkTinGzTxniNjkHfkpGLngJ_Y7ie+B4PiFUcrLDc-u@mail.gmail.com>
	<AANLkTimCeg_s5o7th-20cd77045CVrRAFowKwt8COXLa@mail.gmail.com>
Message-ID: <AANLkTinOm7WaxyMSmZtXpbsLNy1Mnk0h3WdjatQsOV2S@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm sorry, I don't understand. Can you give me a few details on 'how one
builds a root filesystsm with glibc instead of uclibc, please?
On Mar 17, 2011 11:33 AM, "Diego Iastrubni" <diegoiast@gmail.com> wrote:
> You need now different configurations. Since rebuild of the whole target
is
> pretty heavy - I suggest using tow different checkouts.
>
> On Thu, Mar 17, 2011 at 4:37 PM, Charles Krinke <charles.krinke@gmail.com
>wrote:
>
>> Gentlemen:
>>
>> I have a request to provide our MPC8323E build with both uclibc and glibc
>> support in seperate builds so this leads to a question or at least an
>> education of my naivety.
>>
>> Can we build glibc as well as uclibc with buildroot? If so, how is it
done?
>> I *did* go looking for this switch and did not find it, so this is the
>> opportunity for someone to say "its right there in file x, Charles"
>>
>> --
>> Charles Krinke
>>
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110317/6e515dca/attachment.html>
