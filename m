From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 3 Jun 2017 23:16:07 +0200
Subject: [Buildroot] [PATCH] package/uboot-tools: revert the removal of
 0001-drop-configh-from-tools.patch
In-Reply-To: <CAOMZO5Cs-Tqkkye7_GFtjDUWHOM1HHy5H39did8MM9=15HH8yw@mail.gmail.com>
References: <20170603172410.17504-1-romain.naour@gmail.com>
 <CAOMZO5Cs-Tqkkye7_GFtjDUWHOM1HHy5H39did8MM9=15HH8yw@mail.gmail.com>
Message-ID: <2afd880c-857f-eb9a-65a7-cfbf93eb8e31@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

Le 03/06/2017 ? 21:58, Fabio Estevam a ?crit :
> On Sat, Jun 3, 2017 at 2:24 PM, Romain Naour <romain.naour@gmail.com> wrote:
>> Patch 0001-drop-configh-from-tools.patch is not upstream, instead it
>> must be rebased on top of 2017.05 release since the code was moved by
>> [1].
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/949/94910513d1b14e3b02ec4aed34de89d1b1d7a12a
>>
>> [1] http://git.denx.de/?p=u-boot.git;a=commit;h=9d80b49a671c9922931adcd823aab0ed319a42d1
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc:  Fabio Estevam <festevam@gmail.com>
> 
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> 
> Can't we have this patch upstreamed instead of keeping it in Buildroot?

I don't think this patch can be upstreamed as is because building u-boot tools
without a "dot-config" is not currently officially supported by u-boot.

See 0002-tools-only-in-no-dot-config-targets.patch reverting an upstream commit
to add "tools-only" target.

Maybe it's something to ask to u-boot maintainers?

Best regards,
Romain

> 
> Thanks
> 
