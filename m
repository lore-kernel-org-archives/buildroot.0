From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 9 Dec 2015 23:31:45 +0100
Subject: [Buildroot] [PATCH] libsoc: bump to 0.7.1
In-Reply-To: <20151209231125.754af784@free-electrons.com>
References: <1449669809-8380-1-git-send-email-yegorslists@googlemail.com>
 <20151209231125.754af784@free-electrons.com>
Message-ID: <CAGm1_kvTyGyDtvnsVpo_Tw53jUqEAWHqGZwapp9vsifxt=vPAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 9, 2015 at 11:11 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Yegor,
>
> On Wed,  9 Dec 2015 15:03:29 +0100, yegorslists at googlemail.com wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> Remove upstreamed patch.
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>>  ...0001-spi-fix-build-against-MUSL-C-library.patch | 28 ----------------------
>>  package/libsoc/libsoc.mk                           |  2 +-
>>  2 files changed, 1 insertion(+), 29 deletions(-)
>>  delete mode 100644 package/libsoc/0001-spi-fix-build-against-MUSL-C-library.patch
>
> Applied, thanks. You could add a hash file for this package, since we
> now add hash files for github-sourced packages.

Will do. Thanks.

Yegor
