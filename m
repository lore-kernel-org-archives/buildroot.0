From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jun 2016 09:25:56 +0200
Subject: [Buildroot] [PATCH v2 3/8] php-zmq: bump version to 1.1.3
In-Reply-To: <1460980391-65336-4-git-send-email-Vincent.Riera@imgtec.com>
References: <1460980391-65336-1-git-send-email-Vincent.Riera@imgtec.com>
 <1460980391-65336-4-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160613092556.6f06e2f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Apr 2016 12:53:06 +0100, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/php-zmq/php-zmq.hash | 2 +-
>  package/php-zmq/php-zmq.mk   | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)

This causes a build failure on Blackfin:

  http://autobuild.buildroot.net/results/da6/da67a515eff825a57e523b9f80485a4c50fffeda/build-end.log

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
