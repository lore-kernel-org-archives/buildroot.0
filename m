From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 17 May 2012 12:02:01 +0200
Subject: [Buildroot] [PATCH v2 06/11] manual: update working-with.txt
In-Reply-To: <CAAXf6LVSrt1egUubKg_-HOPwy9JWffSQF2O8AogHnT7+uoLGzw@mail.gmail.com>
References: <4FAEEFA8.2070005@mind.be>
 <1336905501-9757-1-git-send-email-s.martin49@gmail.com>
 <1336905501-9757-7-git-send-email-s.martin49@gmail.com>
 <CAAXf6LVSrt1egUubKg_-HOPwy9JWffSQF2O8AogHnT7+uoLGzw@mail.gmail.com>
Message-ID: <CAHXCMML5hF0OtYj8AeboFLBmhQ43pCw=+vKeCrosFyX7faqgGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/5/16 Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>:
> On Sun, May 13, 2012 at 12:38 PM, Samuel Martin <s.martin49@gmail.com> wrote:
>> From: Samuel MARTIN <s.martin49@gmail.com>
>>
[...]
>> diff --git a/docs/manual/working-with.txt b/docs/manual/working-with.txt
>> index 01f1041..b9d915c 100644
>> --- a/docs/manual/working-with.txt
>> +++ b/docs/manual/working-with.txt
>> @@ -1,6 +1,9 @@
>> ?Working with Buildroot
>> ?======================
>> -[[working-with-br]]
>> +
>> +This section aims to explain how Buildroot allows you to tune,
>> +customize almost everthing... making your configuration fitting your
>> +needs.
>
> What is the difference between tune and customize? Later you also use
> 'tweaking'.
My first thoughts were: tuning or customizing BR means "making changes
through the configuration interface (i.e. adjusting toolchain
features, package selection and so on), whereas tweaking was more
likely hacking BR itself (i.e adding new packages, support for new
boards/architectures/...).

But, I admit the difference between these 3 words is not so obvious.
Let's put 'hacking' in instead of 'tweaking'.


> s/everthing/everything/
> s/fitting/fit/
>
> But, rephrasing suggestion:
> This section explains how you can customize Buildroot to fit your needs.
Fair enough.
The simpler, the better!

>
>>
>> ?include::make-tips.txt[]
>>
>> @@ -10,3 +13,10 @@ include::common-usage.txt[]
>>
>> ?Tweaking Buildroot
>> ?------------------
>> +
>> +Because Buildroot does not yet fit all your requirements, you may be
>> +intrested in tweaking it to add:
>
> s/Because/If/
> s/intrested/interested/
>
>> +
>> +* new packages: refer to the xref:adding-packages[Developer guide]
>> +
>> +* new board support: refer to the xref:board-support[Developer guide]
>> --
>> 1.7.10.2
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
