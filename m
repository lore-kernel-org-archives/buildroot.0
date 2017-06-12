From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jun 2017 23:42:51 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/erlang-p1-xmpp: Add a
 missing dependency from a selected package
In-Reply-To: <20170612144153.26929-1-johan.oudinet@gmail.com>
References: <20170612144153.26929-1-johan.oudinet@gmail.com>
Message-ID: <20170612234251.240a9d80@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Jun 2017 16:41:53 +0200, Johan Oudinet wrote:
> From: Johan Oudinet <johan.oudinet@green-communications.fr>
> 
> This package selects erlang-p1-stringprep, which depends on
> BR2_INSTALL_LIBSTDCPP. Thus, it should also depend on this item.
> 
> This should fix http://autobuild.buildroot.net/results/fe7/fe76971fead52acdd64612161e92a48a4ad36572/
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@green-communications.fr>
> ---
>  package/erlang-p1-xmpp/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
