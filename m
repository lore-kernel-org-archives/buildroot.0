From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:50:42 +0200
Subject: [Buildroot] [RFC 1/4] support/scripts: add generic genimage
 script
In-Reply-To: <20170329145120.11863-2-etienne.phelip@savoirfairelinux.com>
References: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
 <20170329145120.11863-2-etienne.phelip@savoirfairelinux.com>
Message-ID: <20170401155042.1c582435@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Mar 2017 10:51:17 -0400, Etienne Phelip wrote:
> This script is a wrapper for the genimage tool used by most boards.
> The board postimage script can now call this script instead of invoking
> genimage command themselves.
> 
> Signed-off-by: Etienne Phelip <etienne.phelip@savoirfairelinux.com>
> ---
>  support/scripts/genimage.sh | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100755 support/scripts/genimage.sh

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
