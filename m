From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 14:52:15 +0200
Subject: [Buildroot] [PATCH 1/2] package/libpthsem: remove
 argp-standalone dependency
In-Reply-To: <1430562486-23625-1-git-send-email-romain.naour@openwide.fr>
References: <1430562486-23625-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150502145215.3acf1481@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat,  2 May 2015 12:28:05 +0200, Romain Naour wrote:
> argp-standalone provide libargp.a and argp.h which are
> never used in libpthsem.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/libpthsem/Config.in    | 1 -
>  package/libpthsem/libpthsem.mk | 1 -
>  2 files changed, 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
