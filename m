From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 20 Jul 2012 13:55:52 +0100
Subject: [Buildroot] [PATCH v3] lighttpd: use standard web root directory
In-Reply-To: <5009545B.1090802@free-electrons.com>
References: <1342779436-3427-1-git-send-email-spdawson@gmail.com>
 <50094DD6.6080102@free-electrons.com>
 <CAHt8ZCN8bh_yqEj5Nspkw7D_nZ=7UkChnFHNdbhZTiCQY77aEQ@mail.gmail.com>
 <5009545B.1090802@free-electrons.com>
Message-ID: <CAHt8ZCME03aZTU=oL_Ut0sVVoS-gu1Tat7s1+MMZq0bPKKBF=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

On 20 July 2012 13:51, Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
> Ok, my question was more about why you replaced them by install -d
> actually, but mostly out of curiosity :)

I see. I misunderstood you; sorry, my mistake. I guess it is a bit of
a gratuitous change, in a way. If you feel strongly about it, then I'm
happy to leave the mkdir calls instead.

> Then you can add my
> Acked-By: Maxime Ripard <maxime.ripard@free-electrons.com>
> To your next iteration with your signed-off-by in the patch.

Thanks for that. Will resubmit with your ack.

Simon.
