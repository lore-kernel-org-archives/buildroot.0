From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 16 Nov 2012 14:14:31 +0000
Subject: [Buildroot] [PATCH] manual: minor tweaks
In-Reply-To: <201211161355.19631.yann.morin.1998@free.fr>
References: <1353067194-32240-1-git-send-email-spdawson@gmail.com>
 <201211161355.19631.yann.morin.1998@free.fr>
Message-ID: <CAHt8ZCNWA0qceeq-KJneZQ7Vyqfk3oVVTc1zxeyhXrxz4GcMSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16 November 2012 12:55, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Please find my comments below.

Hi Yann; thanks for the feedback.

>> diff --git a/docs/manual/how-buildroot-works.txt b/docs/manual/how-buildroot-works.txt
>> index 879cff3..31774c0 100644
>> --- a/docs/manual/how-buildroot-works.txt
>> +++ b/docs/manual/how-buildroot-works.txt
>> @@ -9,7 +9,7 @@ also includes patches for various software packages - mainly the ones
>>  involved in the cross-compilation tool chain (+gcc+, +binutils+ and
>>  +uClibc+).
>>
>> -There is basically one Makefile per software package, and they are
>> +There is basically one Makefile for each software package, and they are
>
> Why? 'per' is perfectly legit in this context.

I tend to avoid the Latin "per" habitually in my writing, because of
previous bad experiences with (human) translators. But I don't feel
strongly about it, so let's leave it in here.

>> diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
>> index e0a5a2a..c32f855 100644
>> --- a/docs/manual/writing-rules.txt
>> +++ b/docs/manual/writing-rules.txt
>> @@ -3,7 +3,7 @@
>>  Writing rules
>>  -------------
>>
>> -Overall, those writing rules are here to help you add new files in
>> +Overall, these writing rules are here to help you add new files in
>
> Proper use of 'these' in this case! ;-)

Well, either "those" refers to "those people" here --- in which case
it is correct --- or else the reference is to the rules themselves. It
is not completely clear to me from the context which sense is
intended, but I assume that it is the rules themselves that are
referred to.

> When you have addressed these changes, you can add my:
>   - Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks,

Simon.
