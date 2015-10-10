From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 12:55:44 +0200
Subject: [Buildroot] [PATCH v3 01/37] package/efl: remove shared version
 number
In-Reply-To: <1444471422-15118-2-git-send-email-romain.naour@openwide.fr>
References: <1444471422-15118-1-git-send-email-romain.naour@openwide.fr>
 <1444471422-15118-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151010125544.6d33a1cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 10 Oct 2015 12:03:06 +0200, Romain Naour wrote:
> This is necessary to move efl packages to package directory
> and prepare the efl version bump to the latest release.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/efl/efl.mk                                             | 1 -
>  package/efl/expedite/expedite.mk                               | 2 +-
>  package/efl/libecore/libecore.mk                               | 2 +-
>  package/efl/libedbus/libedbus.mk                               | 2 +-
>  package/efl/libedje/libedje.mk                                 | 2 +-
>  package/efl/libeet/libeet.mk                                   | 2 +-
>  package/efl/libefreet/libefreet.mk                             | 2 +-
>  package/efl/libeina/libeina.mk                                 | 2 +-
>  package/efl/libeio/libeio.mk                                   | 2 +-
>  package/efl/libelementary/libelementary.mk                     | 2 +-
>  package/efl/libembryo/libembryo.mk                             | 2 +-
>  package/efl/libethumb/libethumb.mk                             | 2 +-
>  package/efl/libevas-generic-loaders/libevas-generic-loaders.mk | 2 +-
>  package/efl/libevas/libevas.mk                                 | 2 +-
>  14 files changed, 13 insertions(+), 14 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
