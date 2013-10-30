From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 30 Oct 2013 08:48:36 +0100
Subject: [Buildroot] [PATCH v3 2/2] ModemManager: add new package
In-Reply-To: <526FEBDB.80307@mind.be>
References: <1382962191-6274-1-git-send-email-yegorslists@googlemail.com>
 <1382962191-6274-2-git-send-email-yegorslists@googlemail.com>
 <526FEBDB.80307@mind.be>
Message-ID: <CAGm1_ktbWjiVGGj=TmWstFB=MsMqb9A0+LV2p6G2S7iEWWeBdQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 29, 2013 at 6:09 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 28/10/13 13:09, yegorslists at googlemail.com wrote:
> [snip]
>> +comment "modemmanager requires a toolchain with IPV6, LARGEFILE, WCHAR and thread support and the udev infrastructure"
>> +     depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || \
>> +             !BR2_TOOLCHAIN_HAS_THREADS || !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
>
>  We've standardized this type of comment into
>
> comment "modemmanager needs udev and a toolchain w/ largefile, wchar, threads, IPv6"

Thanks. Will send v4

Yegor
