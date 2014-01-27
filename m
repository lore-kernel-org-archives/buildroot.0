From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Mon, 27 Jan 2014 21:13:29 +0100
Subject: [Buildroot] [PATCH 1/1] Prefer 'command -v' over 'which' (for
	portability)
In-Reply-To: <52E608A0.3000305@mind.be>
References: <1390659116-18865-1-git-send-email-bjorn.forsman@gmail.com>
 <52E608A0.3000305@mind.be>
Message-ID: <CAEYzJUGtztOs38E_L0kbQWfLuA+NQ0Etvfq=9N_pKT6E15O+YQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27 January 2014 08:20, Arnout Vandecappelle <arnout@mind.be> wrote:
[...]
>  There are also instances of which in manual.mk and toolchain-external.mk.

Oh, I missed those. Thanks.

>  With those removed, I wonder if it is even necessary to have which
> installed at all? Could you test that with a largish config?

Testing a "raspberrypi_defconfig" build now without any "which"
(removed the check for "which" check in dependencies.sh too).
