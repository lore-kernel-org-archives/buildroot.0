From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 21:52:07 +0200
Subject: [Buildroot] [PATCH 1/2] linux-headers: remove deprecated
 versions
In-Reply-To: <1473434455-16004-1-git-send-email-gustavo@zacarias.com.ar>
References: <1473434455-16004-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160911215207.25554064@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Sep 2016 12:20:54 -0300, Gustavo Zacarias wrote:
> Linux headers 3.19.x and 4.0.x have been deprecated for a while now, so
> it's time to remove them.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  Config.in.legacy                     | 20 ++++++++++++++++++++
>  package/linux-headers/Config.in.host | 10 ----------
>  2 files changed, 20 insertions(+), 10 deletions(-)

Both applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
