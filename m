From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 16:50:52 +0200
Subject: [Buildroot] [PATCH 4/9] package/systemd: Default yes for
 timesyncd
In-Reply-To: <1467467955-14609-4-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467467955-14609-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1467467955-14609-4-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20160702165052.7d3c21c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 15:59:10 +0200, Maxime Hadjinlian wrote:
> It seems logical to enable a few options along with systemd when it's
> the init system.
> 
> Also change the help as timesyncd is a daemon that implements an SNTP client.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/systemd/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
