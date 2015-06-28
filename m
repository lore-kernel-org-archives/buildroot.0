From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 14:03:21 +0200
Subject: [Buildroot] [PATCH] package/vlc: install vlc libraries in
 staging
In-Reply-To: <1435489228-7010-1-git-send-email-romain.naour@openwide.fr>
References: <1435489228-7010-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150628140321.1c58ee96@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun, 28 Jun 2015 13:00:28 +0200, Romain Naour wrote:
> Although no package seems to link against vlc libraries right now, these
> libraries will be necessary for upcoming new efl emotion-generic-players
> package.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/vlc/vlc.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
