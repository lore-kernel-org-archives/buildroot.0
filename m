From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 6 Nov 2013 12:19:24 +0000
Subject: [Buildroot] [PATCH] libevas: disable on avr32
In-Reply-To: <CAAXf6LWSZa6hNgqqYgM07ER4t_iF3b26e6O1-jMivBeRnu4RXg@mail.gmail.com>
References: <1383735243-18910-1-git-send-email-spdawson@gmail.com>
 <CAAXf6LV6GFk27s8fpEbcDVKmrkipiKA_FGFEt-wcdXMutkwBoA@mail.gmail.com>
 <CAHt8ZCM6t1qPEOCaTpDOe1ESTF1ZdvNU1CrEkZC5hABzpKf+fg@mail.gmail.com>
 <CAAXf6LWSZa6hNgqqYgM07ER4t_iF3b26e6O1-jMivBeRnu4RXg@mail.gmail.com>
Message-ID: <CAHt8ZCMcVujE=nPgBdnxw_g50+H=TJcmj6x5rOz6ru4T16sm6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 6 November 2013 11:54, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> This is still correct, the comment should not mention the architecture
> dependency.
> But, the comment should only be _visible_ when it is relevant. Since
> the package itself is not relevant on avr32, it makes no sense to show
> the comment. Hence, the comment should get an extra 'depends on
> !avr32'.

Okay, I understand. Thanks for the clarification.

Simon.
