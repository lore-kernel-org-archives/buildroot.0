From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 08:38:38 +0200
Subject: [Buildroot] [PATCH 1/8] pkg-rebar: remove redundant / in front
 of $($(PKG)_ERLANG_LIBDIR)
In-Reply-To: <20170703124502.26113-2-arnout@mind.be>
References: <20170703124502.26113-1-arnout@mind.be>
 <20170703124502.26113-2-arnout@mind.be>
Message-ID: <20170704083838.7546ed09@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 3 Jul 2017 14:44:55 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Sometimes $(1)/$($(PKG)_ERLANG_LIBDIR) is used, sometimes
> $(1)$($(PKG)_ERLANG_LIBDIR). Make this consistent, with /. Therefore,
> remove the leading / from $($(PKG)_ERLANG_LIBDIR).
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v2: keep the /, remove it from $($(PKG)_ERLANG_LIBDIR)
> ---
>  package/pkg-rebar.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
