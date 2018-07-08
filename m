From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 Jul 2018 11:58:21 +0200
Subject: [Buildroot] [PATCH] configs/raspberrypi3_defconfig: fix
 filesystem size
In-Reply-To: <CALtQ3O3=qmz3uWXkUs-ev62qXk0c=RQCtFQ=NaK-WFZGduT39Q@mail.gmail.com>
References: <1530264190-9535-1-git-send-email-leon.anavi@konsulko.com>
 <7061b17f-2365-592c-662b-e383f425e03c@mind.be> <20180708091651.GA2474@scaer>
 <CALtQ3O3=qmz3uWXkUs-ev62qXk0c=RQCtFQ=NaK-WFZGduT39Q@mail.gmail.com>
Message-ID: <6953f6d5-9c0f-61cb-2508-d8dde32a55eb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-07-18 11:32, Leon Anavi wrote:
> Hi Arnout, Yann, All,
> 
> On Sun, Jul 8, 2018, 12:16 Yann E. MORIN <yann.morin.1998@free.fr
> <mailto:yann.morin.1998@free.fr>> wrote:
> 
>     Arnout, All,
> 
>     On 2018-07-08 00:35 +0200, Arnout Vandecappelle spake thusly:
>     > On 29-06-18 11:23, Leon Anavi wrote:
>     > > Increase the filesystem size for raspberrypi3 by setting
>     > > BR2_TARGET_ROOTFS_EXT2_SIZE to "120M". The filesystem for
>     > > raspberrypi3_64 has the same size.
>     > >
>     > > Fixes:
>     > > Copying files into the device: __populate_fs: Could not allocate block
>     in ext2 filesystem while writing file "services"
>     > > mkfs.ext4: Could not allocate block in ext2 filesystem while populating
>     file system
>     > >
>     > > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com
>     <mailto:leon.anavi@konsulko.com>>
>     >
>     >? Applied to master, thanks.
> 
>     Not really, I'm afraid...
> 
> 
> I am also afraid that I still don't see it in master.
 I pushed now, thanks for the heads-up.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
