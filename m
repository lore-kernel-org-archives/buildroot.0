From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 17 Aug 2012 21:03:52 +0300
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.0j
In-Reply-To: <502E7775.2060006@zacarias.com.ar>
References: <1336751148-28858-1-git-send-email-gustavo@zacarias.com.ar>
 <20120817184902.61d989c0@skate> <502E7775.2060006@zacarias.com.ar>
Message-ID: <502E8788.7050808@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

17.8.2012 19:55, Gustavo Zacarias kirjoitti:
> On 08/17/12 13:49, Thomas Petazzoni wrote:
>
>> At http://patchwork.ozlabs.org/patch/148560/ we have a patch that has
>> been sitting for a long time, which bumps the version of openssl to
>> 1.0.1. Looking at the OpenSSL website, I see that both the 1.0.0X
>> versions and 1.0.1X versions are maintained. Do you know what they
>> mean, and whether we should stay at 1.0.0 or move to 1.0.1?
>>
>> I simply would like to know what to do with this patch in our
>> patchwork :)
>>
>> Thanks!
>>
>> Thomas
> 1.0.1 is security-vulnerable, so it can't be bumped as-is, the target
> should be 1.0.1c at the moment.
> The big difference between 1.0.0* and 1.0.1* is that the later has
> initial support for TLSv1.1 and TLSv1.2 among other minor details.
> Both are API compatible though not ABI (and we don't care).
> I can give it a test during the weekend and give it a go for -next.
> Regards.

Don't know about 1.0.1c version (or greater) but what's it worth, I have
had version 1.0.1b sitting in my buildroot copy like ages
and so far have not noticed anything strange in my buildroot based home
distro.


Best regards
Stefan
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
