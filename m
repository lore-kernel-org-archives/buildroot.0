From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 28 Aug 2012 12:52:30 +0100
Subject: [Buildroot] [PATCH 2/4] zeromq: add license information
In-Reply-To: <CAHt8ZCOvvbkuK4JUaiMC+RHtLTR2hvMEbA_Vdfk35s6vUJnRdQ@mail.gmail.com>
References: <1345406924-6574-1-git-send-email-spdawson@gmail.com>
 <1345406924-6574-2-git-send-email-spdawson@gmail.com>
 <20120821124200.59ffab03@skate>
 <CAHt8ZCN0P9_xEWzKhWcKLy=WixYoE8ZtVS0WYkmxT_Cu8ufrow@mail.gmail.com>
 <50379455.8090907@lucaceresoli.net>
 <CAHt8ZCOvvbkuK4JUaiMC+RHtLTR2hvMEbA_Vdfk35s6vUJnRdQ@mail.gmail.com>
Message-ID: <CAHt8ZCOwbsbOpO2h8PgeYvnTObAZGX0xEN-9xsMy_LoPuOuTfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There has now been a response to my request on the 0MQ mailing list:

On 28 August 2012 12:38, Pieter Hintjens <ph@imatix.com> wrote:
> Indeed, this was the old JSON parsing library we used years ago for
> device configuration.
>
> Thanks for catching this. I'll fix the license.

So, as Luca suggested, the MIT/X11 license clause in COPYING.LESSER is
no longer required.

Consequently (and, again, as suggested by Luca), the license for the
Buildroot zeromq package would appear to be "LGPLv3+ with exceptions".

I'll fix my patch, and resubmit.

Simon.
