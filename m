From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 23:20:42 +0100
Subject: [Buildroot] [PATCH 1/1] qt5webkit{,
 -examples}: use https link in hashfile
In-Reply-To: <20180210191138.5518-1-gael.portay@savoirfairelinux.com>
References: <20180210191138.5518-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180213232042.72e6c985@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Feb 2018 14:11:38 -0500, Ga?l PORTAY wrote:
> All Qt modules but qt5webkit use https link in their hashfile.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  package/qt5/qt5webkit-examples/qt5webkit-examples.hash | 4 ++--
>  package/qt5/qt5webkit/qt5webkit.hash                   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
