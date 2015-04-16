From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Apr 2015 07:59:28 +0200
Subject: [Buildroot] [PATCH 1/1] monit: bump to version 3.12.2
In-Reply-To: <1429129390-28278-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1429129390-28278-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <20150416075928.7b0a7a3a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sebastien Bourdelin,

On Wed, 15 Apr 2015 16:23:10 -0400, Sebastien Bourdelin wrote:
> Also add hash file and remove the m4 directory creation from the monit.mk
> which is now in the source tree.
> 
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
> ---
>  package/monit/monit.hash | 6 ++++++
>  package/monit/monit.mk   | 8 +-------
>  2 files changed, 7 insertions(+), 7 deletions(-)
>  create mode 100644 package/monit/monit.hash

Applied after keeping only the upstream sha256 in the hash file, as
suggested by Baruch, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
