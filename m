From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 22:20:39 +0100
Subject: [Buildroot] [PATCH 6/6] efl: remove broken JP2K loader
In-Reply-To: <20170307235054.25149-6-arnout@mind.be>
References: <20170307235054.25149-1-arnout@mind.be>
 <20170307235054.25149-6-arnout@mind.be>
Message-ID: <20170309222039.3d5e0663@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 8 Mar 2017 00:50:54 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> This option has been marked as broken since 2016.08. Since nobody
> repaired it, we'll just remove it.
> 
> Since technically it was already removed in 2016.08, it's added to the
> 2016.08 section of the legacy menu.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
> ---
> Romain, Gustavo, last chance to unbreak the package :-)
> ---
>  Config.in.legacy      |  7 +++++++
>  package/efl/Config.in | 10 ----------
>  package/efl/efl.mk    |  8 +-------
>  3 files changed, 8 insertions(+), 17 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
