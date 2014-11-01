From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Sat, 1 Nov 2014 18:12:02 +0100
Subject: [Buildroot] [PATCH 1/1] xinetd: change to snapshot.debian.org
 and add hash
In-Reply-To: <CABbD_XBrSqZmXw2BuM46dKZYbRyYvTOzP3LZgkMBfx7F=jLkaQ@mail.gmail.com>
References: <1414859755-33664-1-git-send-email-kaszak@gmail.com>
 <20141101180237.6b82f0f4@free-electrons.com>
 <CABbD_XBrSqZmXw2BuM46dKZYbRyYvTOzP3LZgkMBfx7F=jLkaQ@mail.gmail.com>
Message-ID: <CABbD_XDxG8MKvChV=4jH0mvGywtwtirwr8kmLiz-Qi1DZ48qXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've compared the 2 files, and they differ indeed, although the same
version.
Mostly $Id changes, and the remove of a FREEBSD conditional macro from
somewhere.
I'd say it's safe to use either.

Best regards,
Karoly

On Sat, Nov 1, 2014 at 6:06 PM, K?roly Kasza <kaszak@gmail.com> wrote:

> Hi,
>
> I'm not sure, but that seems logical.
> The sha256 sum from github.com differs from debian.org.
> Which one to prefer?
>
> Best regards,
> Karoly
>
> On Sat, Nov 1, 2014 at 6:02 PM, Thomas Petazzoni <
> thomas.petazzoni at free-electrons.com> wrote:
>
>> Dear Karoly Kasza,
>>
>> On Sat,  1 Nov 2014 17:35:55 +0100, Karoly Kasza wrote:
>>
>> >  XINETD_VERSION = 2.3.15
>> > -XINETD_SITE = http://www.xinetd.org
>> > +XINETD_SOURCE = xinetd_$(XINETD_VERSION).orig.tar.gz
>> > +XINETD_SITE =
>> http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/x/xinetd
>>
>> Just wondering, isn't https://github.com/xinetd-org/xinetd the new
>> appropriate upstream site?
>>
>> There is even a 2.3.15 release at
>> https://github.com/xinetd-org/xinetd/releases.
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
>>
>
>
>
> --
>
> ?dv,
> KK
>



-- 

?dv,
KK
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141101/b3cfb2fc/attachment.html>
