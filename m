From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Feb 2015 12:38:49 +0100
Subject: [Buildroot] [PATCH 07/16] package/dropbear: install
 dropbear.service to correct dir
In-Reply-To: <1421684056-5266-8-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-8-git-send-email-maxtram95@gmail.com>
Message-ID: <20150223123849.12669e11@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxim Mikityanskiy,

On Mon, 19 Jan 2015 18:14:07 +0200, Maxim Mikityanskiy wrote:
> The place for package-provided systemd units is /lib/systemd/system.
> /etc/systemd/system is for custom units.
> ---
>  package/dropbear/dropbear.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
