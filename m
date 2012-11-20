From: Woody Wu <narkewoody@gmail.com>
Date: Tue, 20 Nov 2012 11:24:36 +0000 (UTC)
Subject: [Buildroot] How to regenerate zImage?
References: <slrnkamf41.9pu.narkewoody@zuhnb712.local.com>
 <20121120100158.15b1b159@skate>
Message-ID: <slrnkamq24.2u9.narkewoody@zuhnb712.local.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-11-20, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>
wrote:
> Dear Woody Wu,
>
> On Tue, 20 Nov 2012 08:17:54 +0000 (UTC), Woody Wu wrote:
>> After I made any small changes in kernel source, I can force the
>> kernel to be rebuilt by removing the .stamp_built under the
>> output/build/linux-version directory.  But, it's strange that the
>> output/zImage file always not get recreated or rebuilt.
>> 
>> How should I force the buildroot to regenerate the zImage file for
>> me?
>
> make linux-rebuild
Thanks, I will try.

>
> However, note that making changing to the source code anywhere in
> output/build/... is a really stupid idea, as all those changes will be
> lost next time you do 'make clean'.
>
Yes, I agree this is stupid. So I also really like to know whta's the
best practice to do this kind of work. Would you be so kind to have a
introduction or point me to a docment? Thanks


-- 
woody
I can't go back to yesterday - because I was a different person then.
