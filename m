From: Gilad Ben-Yossef <gilad@benyossef.com>
Date: Tue, 18 Apr 2017 13:59:59 +0300
Subject: [Buildroot] [PATCH 1/1] openssh: add support for HW SSL engines
In-Reply-To: <20170418094209.guuqycx7yrmodmj2@sapphire.tkos.co.il>
References: <1492505276-25285-1-git-send-email-gilad@benyossef.com>
 <20170418094209.guuqycx7yrmodmj2@sapphire.tkos.co.il>
Message-ID: <CAOtvUMe9Dta4EVPOkwZxZ3ujSH1C156G_cpn1pOvffGHUeA0wg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 18, 2017 at 12:42 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Gilad,
>
> Thanks for you contribution. I have a small comment inline below.
>
> On Tue, Apr 18, 2017 at 11:47:56AM +0300, Gilad Ben-Yossef wrote:
...
>>
>> +ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX), y)
>
> Redundant space before 'y'.
>

Thanks Baruch,

I will fix it and re-send the patch.

Gilad

-- 
Gilad Ben-Yossef
Chief Coffee Drinker

"If you take a class in large-scale robotics, can you end up in a
situation where the homework eats your dog?"
 -- Jean-Baptiste Queru
