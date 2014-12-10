From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 00:20:17 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/openpowerlink: enable
 dynamic build
In-Reply-To: <1418246696-27658-3-git-send-email-romain.naour@openwide.fr>
References: <1418246696-27658-1-git-send-email-romain.naour@openwide.fr>
 <1418246696-27658-3-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141211002017.48f6c102@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed, 10 Dec 2014 22:24:56 +0100, Romain Naour wrote:
> Also remove the install hook, all static libraries are
> removed from TARGET_DIR/usr/lib by target-finalize target
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
