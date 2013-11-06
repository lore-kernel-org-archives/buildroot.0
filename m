From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 6 Nov 2013 11:09:16 +0000
Subject: [Buildroot] [PATCH] libevas: disable on avr32
In-Reply-To: <CAAXf6LV6GFk27s8fpEbcDVKmrkipiKA_FGFEt-wcdXMutkwBoA@mail.gmail.com>
References: <1383735243-18910-1-git-send-email-spdawson@gmail.com>
 <CAAXf6LV6GFk27s8fpEbcDVKmrkipiKA_FGFEt-wcdXMutkwBoA@mail.gmail.com>
Message-ID: <CAHt8ZCM6t1qPEOCaTpDOe1ESTF1ZdvNU1CrEkZC5hABzpKf+fg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, thanks for the feedback.

On 6 November 2013 11:05, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> In all these places, the new 'depends on' should be repeated on the
> comment that is shown when one of the toolchain options is missing.

Okay. I thought the policy was not to mention architecture
dependencies on the comments...

> Regarding the structure:
>        # libevas
>        depends on !BR2_avr32
>
> I find it more clear to use:
>        depends on !BR2_avr32  # libevas

Okay. I'll tidy this up.

Simon.
