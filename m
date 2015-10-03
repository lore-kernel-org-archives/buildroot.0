From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 3 Oct 2015 18:41:49 +0200
Subject: [Buildroot] [PATCH] package/schifra: remove package
In-Reply-To: <1443890105-2962-1-git-send-email-romain.naour@openwide.fr>
References: <1443890105-2962-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <5610054D.1070300@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Le 03/10/2015 18:35, Romain Naour a ?crit :
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Cc: Arnaud R?billout <rebillout@syscom.ch>
> Cc: Simon Dawson <spdawson@gmail.com>
> ---
>  Config.in.legacy             |  6 ++++++
>  package/Config.in            |  1 -
>  package/schifra/Config.in    | 26 --------------------------
>  package/schifra/schifra.hash |  3 ---
>  package/schifra/schifra.mk   | 44 --------------------------------------------
>  5 files changed, 6 insertions(+), 74 deletions(-)
>  delete mode 100644 package/schifra/Config.in
>  delete mode 100644 package/schifra/schifra.hash
>  delete mode 100644 package/schifra/schifra.mk
> 

I get an "Undelivered Mail Returned to Sender" reply from Arnaud R?billout
address, so the last potential schifra user can't be contacted anymore.

Best regards,
Romain
