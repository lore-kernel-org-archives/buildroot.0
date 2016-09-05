From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Sep 2016 23:36:11 +0200
Subject: [Buildroot] [PATCH] libgtk3: fix typo
In-Reply-To: <1473110212-14012-1-git-send-email-gustavo@zacarias.com.ar>
References: <1473110212-14012-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160905233611.1248c5cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Sep 2016 18:16:52 -0300, Gustavo Zacarias wrote:
> It's wayland, not waylandd, hence gtk3+ with the wayland backend went
> completely poof.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libgtk3/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
