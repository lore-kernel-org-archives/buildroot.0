From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 23 Nov 2015 18:25:14 +0100
Subject: [Buildroot] [PATCH 06/51] package/perl: include perl-cross in
 the legal-info output
In-Reply-To: <f360919da5180e26ce4f96eefed14c29b526b428.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
 <f360919da5180e26ce4f96eefed14c29b526b428.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <56534BFA.8060203@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

Yann E. MORIN wrote:
> The perl-cross sources are combined with the perl sources, so they must
> be redistributed for proper compliance.
>
> Add a post-legal-info hook that also installs them in the legal-info
> output.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Francois Perrad <fperrad@gmail.com>

Ouch:

$ make legal-info
[...]
mkdir: missing operand
Try 'mkdir --help' for more information.
make[1]: *** [perl-legal-info] Error 1
make: *** [_all] Error 2

This probably needs patch 10.

-- 
Luca
