From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Thu, 3 Jan 2013 18:54:19 +0100
Subject: [Buildroot] [RFC] How to handle targets that need more than one
 file system to boot?
In-Reply-To: <201301031833.44543.yann.morin.1998@free.fr>
References: <201212240100.17473.yann.morin.1998@free.fr>
 <CAJJ6jxudS63P58imQ6nPn=_AA9JoBMZp3i=Dq2As1c9EiCDZxg@mail.gmail.com>
 <CAKvQZ_0r6DyEt=1XZWZ5RwFYg-LaU1xvyJcYTVn0sje+696nkA@mail.gmail.com>
 <201301031833.44543.yann.morin.1998@free.fr>
Message-ID: <CAEYzJUFB5qbQBguXNoux=kqMHhqpj0pKDFhBi6j0FHAF7QU8Mw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 3 January 2013 18:33, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Willy, All,
>
> On Thursday 03 January 2013 Willy Lambert wrote:
>> 2013/1/3 Steve Calfee <stevecalfee@gmail.com>:
> [--SNIP--]
>> > Maybe we are talking about different things. I think there is a config
>> > option in buildroot that allows you to build multiple output
>> > filesystems, I believe I have created ext4 and a tar.gz as outputs. I
>> > think there are also various flash file systems you can create.
>>
>> I'm curious to know how you do ext4 from BR. I did not found that, and
>> ASAIK, there is no documentation about outputs (and it's a real pain
>> for new comers like me)
>
> Indeed, not sure about ext4. But it's doable for ext3:
>   - first create an ext2 filesystem with genext2fs
>   - then add the ext3 feature with something like tune2fs -j
>
> As for ext4, it is probably not possible, as it is really different from
> an ext2/3 filesystem.

You can also convert ext3 to ext4:

https://ext4.wiki.kernel.org/index.php/Ext4_Howto#Converting_an_ext3_filesystem_to_ext4

Best regards,
Bj?rn Forsman
