From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 15:52:26 +0100
Subject: [Buildroot] [PATCH] mpd: security bump to version 0.19.11
In-Reply-To: <1446561356-27107-1-git-send-email-gustavo@zacarias.com.ar>
References: <1446561356-27107-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151103155226.3908d13b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  3 Nov 2015 11:35:56 -0300, Gustavo Zacarias wrote:
> Fixes an ape tag parsing buffer overflow.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/mpd/mpd.hash | 2 +-
>  package/mpd/mpd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
