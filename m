From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Nov 2017 12:01:30 +0100
Subject: [Buildroot] [PATCH 1/1] qt5webkit: fix URL for 5.6 download
In-Reply-To: <20171124223737.14510-1-gael.portay@savoirfairelinux.com>
References: <20171124223737.14510-1-gael.portay@savoirfairelinux.com>
Message-ID: <20171125120130.4db40b18@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Nov 2017 17:37:37 -0500, Ga?l PORTAY wrote:
> The Qt community releases are not stored under submodules path
> component.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  package/qt5/qt5webkit/qt5webkit.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
