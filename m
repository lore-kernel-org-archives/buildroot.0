From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 21:50:06 +0100
Subject: [Buildroot] [PATCH] package/logrotate: fixes website in help,
 since logrotate is now hosted by github and fedorahosted.org has
 closed
In-Reply-To: <1489159330-11616-1-git-send-email-julien.boibessot@free.fr>
References: <1489159330-11616-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20170310215006.2c3d64ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Mar 2017 16:22:10 +0100, julien.boibessot at free.fr wrote:
> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> 
> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> ---
>  package/logrotate/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Your commit title was *way* too long. Commit titles should be much
shorter than that, and the long explanation move to the commit log. So
I've reworded that and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
