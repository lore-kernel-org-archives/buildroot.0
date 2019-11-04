From: Carlos Santos <unixmania@gmail.com>
Date: Mon, 4 Nov 2019 17:40:37 -0300
Subject: [Buildroot] [PATCH 01/15] new recipe : host-systemd
In-Reply-To: <CAFvCimWyMdTTZDxv3EyKDaHGXhrzOd2brLSe+BgbuU9oxJ3S8A@mail.gmail.com>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
 <20191103165640.21819-2-jeremy.rosen@smile.fr>
 <CADvTj4o-OmADxosf4md8=cm63D0EUS+mo2ALA2D4odtv668w0Q@mail.gmail.com>
 <CAFvCimVNRXmoQJuxVBYRYZ7zbzpv+P3KoDPfronW9jFT71L13Q@mail.gmail.com>
 <CAJ4jsafSoX5ayztTZgOS38YPtVZbT7gYkk3FKHQ0U1FDG8u+bA@mail.gmail.com>
 <CAFvCimWyMdTTZDxv3EyKDaHGXhrzOd2brLSe+BgbuU9oxJ3S8A@mail.gmail.com>
Message-ID: <CAJ4jsaevbw7K+bjGF5k=APSUmXThTStj0+nDkF9m5TykdrJUMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[adding back the list to the conversation]

On Mon, Nov 4, 2019 at 3:53 PM J?r?my ROSEN <jeremy.rosen@smile.fr> wrote:
>
> Does systemd have a general policy with regard to that ?
>
> How old is the limit for the build system itself ?

I don't know for sure but given the versions of host patch and
coreutils that are still supported (check commits
bef2a36d1f2f49bb50de33affea5a18b0b0b68d7 and
ef60ef83c9e27899666c3c093007208c1203b3e1) I guess Debian 7 and Ubuntu
14.04 are still used.

>
> Le lun. 4 nov. 2019 ? 19:40, Carlos Santos <unixmania@gmail.com> a ?crit :
>>
>> On Mon, Nov 4, 2019 at 2:02 PM J?r?my ROSEN <jeremy.rosen@smile.fr> wrote:
>> >
>> > I have to admit I have trouble testing/evaluationg the host-side dependencies.
>> > Systemd needs a kernel >= 3.13 according to the README.
>> > Buildroot has no requirements for the host-side kernel right now, I'm not really sure how to handle that. Advice welcomed.
>> >
>>
>> [flipping to plain text email]
>>
>> Requiring a kernel >= 3.13 will prevent building on RHEL/CentOS 7,
>> which may be a too drastic restriction.
>>
>> --
>> Carlos Santos <unixmania@gmail.com>
>

-- 
Carlos Santos <unixmania@gmail.com>
