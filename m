From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 12:06:50 +0200
Subject: [Buildroot] [PATCH] package/dawgdic: needs gcc >= 4.7
In-Reply-To: <1439026543-25909-1-git-send-email-romain.naour@openwide.fr>
References: <1439026543-25909-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150808120650.3511a2e5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat,  8 Aug 2015 11:35:43 +0200, Romain Naour wrote:
> std::strtoll is only supported since C++11.
> 
> Fixes:
> http://autobuild.buildroot.net/results/cae/cae3cda9be779ea8359f94d13bbbca97e68495ca/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/dawgdic/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
