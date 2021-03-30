From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Mar 2021 21:51:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnutls: drop unrecognized option
In-Reply-To: <20210329193058.162304-1-fontaine.fabrice@gmail.com>
References: <20210329193058.162304-1-fontaine.fabrice@gmail.com>
Message-ID: <20210330215114.6e2e73e5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 29 Mar 2021 21:30:58 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> crywrap has been dropped since version 3.6.12 and
> https://github.com/gnutls/gnutls/commit/c991b5223140e4ef311afac0f25272e602238826
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gnutls/Config.in |  2 --
>  package/gnutls/gnutls.mk | 14 --------------
>  2 files changed, 16 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
