From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 23:29:12 +0100
Subject: [Buildroot] [PATCH 2/5] package/pseudo: force rpath and pass
 our host CFLAGS
In-Reply-To: <48834016f35af5f0f2ab09bfe73af1a45c96ef4f.1478643505.git.yann.morin.1998@free.fr>
References: <cover.1478643505.git.yann.morin.1998@free.fr>
 <48834016f35af5f0f2ab09bfe73af1a45c96ef4f.1478643505.git.yann.morin.1998@free.fr>
Message-ID: <20161109232912.525d4487@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  8 Nov 2016 23:18:32 +0100, Yann E. MORIN wrote:
> pseudo whines when those are not set, and tries to find a suitable
> value; this is usually correct but risk an incorrect guess in corner
> cases.
> 
> Rather than leaving those in guess-mode, just force them to values we
> know are correct.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
> Cc: Erico Nunes <nunes.erico@gmail.com>
> Cc: Julien BOIBESSOT <julien.boibessot@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Reviewed-by: Arnout Vandecappelle <arnout@mind.be>
> ---
>  package/pseudo/pseudo.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, after changing the single quotes to double quotes,
since that's what we use pretty much everywhere in BR.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
