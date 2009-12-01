From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Tue, 1 Dec 2009 15:23:46 +0100
Subject: [Buildroot] Trying to build in an usual place: /opt instead of /
In-Reply-To: <5cd84ac80912010618n334b9ecck27b26d2b493dca39@mail.gmail.com>
References: <5cd84ac80912010510k26f4af64x6234af2e35adbde1@mail.gmail.com>
	<4d28d4b50912010521v34d7a98fv366b4ebd3e3dcf89@mail.gmail.com>
	<5cd84ac80912010610m79367ab8y592538cc0dac1823@mail.gmail.com>
	<5cd84ac80912010618n334b9ecck27b26d2b493dca39@mail.gmail.com>
Message-ID: <4d28d4b50912010623v21319d9bsc7cb800269cad54@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I don't have the answer to your first question, but you should look at
the way debian provides ia32 emulation on amd64 systems.
They probably add some flags at compilation to use the correct loader.

--
Regards

On Tue, Dec 1, 2009 at 3:18 PM, Olivier Perron
<olivier.perron12@gmail.com> wrote:
> [...]
>>>>
>>>
>>> Why not using chroot ?
>>>
>>
>> Because I still need to access /dev ?
>>
>
> Hum... bad answer !
> # mkdir /opt/dev
> # mount -o bind /dev /opt/dev
> before chrooting should do the trick.
>
> Yes, I will try the chroot route then.
>
> Anyway, if someone knows how to do what I wanted to do in first place,
> please tell me: I'd love to learn what I failed to do !
>
