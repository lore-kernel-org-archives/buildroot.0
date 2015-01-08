From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Thu, 8 Jan 2015 21:36:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/mke2img: "/bin/bash" =>
 "/usr/bin/env bash" shebang
In-Reply-To: <20150108213529.7ca0e484@free-electrons.com>
References: <1420749079-29099-1-git-send-email-bjorn.forsman@gmail.com>
 <20150108213529.7ca0e484@free-electrons.com>
Message-ID: <CAEYzJUGowH3DZJBY9z8aNL4Z2GDabGis97w48T2ig7srjmjEUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 8 January 2015 at 21:35, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Bj?rn Forsman,
>
> On Thu,  8 Jan 2015 21:31:19 +0100, Bj?rn Forsman wrote:
>> For portability. All other Buildroot scripts (i.e. scripts that run on
>> host) already use the "/usr/bin/env bash" shebang.
>>
>> This change is needed for NixOS, which lacks a global /bin/bash.
>>
>> Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
>> ---
>>  package/mke2img/mke2img | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Applied, thanks!
>
> (See: we can be fast! :-))

Indeed! Thanks :-)

- Bj?rn
