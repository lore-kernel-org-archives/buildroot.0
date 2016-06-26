From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 21:47:22 +0200
Subject: [Buildroot] [PATCH] mpv: bump to version 0.18.0
In-Reply-To: <1466964725-31287-1-git-send-email-gustavo@zacarias.com.ar>
References: <1466964725-31287-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160626214722.2e0fef7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Jun 2016 15:12:05 -0300, Gustavo Zacarias wrote:
> gpl3 option removed so drop it otherwise it results in build failure.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/mpv/Config.in | 6 ++++--
>  package/mpv/mpv.hash  | 2 +-
>  package/mpv/mpv.mk    | 3 +--
>  3 files changed, 6 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
