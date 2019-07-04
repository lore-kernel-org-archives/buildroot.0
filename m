From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 04 Jul 2019 06:55:31 +0300
Subject: [Buildroot] [PATCH 1/3] package/libnftnl: bump to version 1.1.3
In-Reply-To: <bac5f180-a5b8-5af6-d512-25bee2fce460@mind.be>
References: <838be080c94bce93e5da8a5a4266be7a2a92be20.1561983176.git.baruch@tkos.co.il>
 <bac5f180-a5b8-5af6-d512-25bee2fce460@mind.be>
Message-ID: <87o92amp1o.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Thu, Jul 04 2019, Arnout Vandecappelle wrote:
> On 01/07/2019 14:12, Baruch Siach wrote:
>> Rebase patch #1.
>> 
>> Cc: Yegor Yefremov <yegorslists@googlemail.com>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>
>  Series applied to master, thanks.
>
>
>>  ...libnftnl_xfree-to-avoid-symbol-namin.patch | 118 ++++++++++--------
>
>  Could you check if this patch is still relevant? Originally, xfree was defined
> as a function so it made sense. However, in 1.0.3 it became a define so it
> shouldn't be needed anymore...

Right. Upstream commit 244d60de2f1 ("utils: define xfree() as macro") in
version 1.0.3 changed that following Thomas' bug report.

I'll send a patch.

>  Also, is path 2 upstreamable?

I'll try.

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
