From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 14:45:18 +0200
Subject: [Buildroot] [PATCH v2] Makefile: remove redundant mkdir from
 *config
In-Reply-To: <1429289283-15524-1-git-send-email-arnout@mind.be>
References: <alpine.LFD.2.11.1504161841100.9373@localhost>
 <1429289283-15524-1-git-send-email-arnout@mind.be>
Message-ID: <20150418144518.6eacde6d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Fri, 17 Apr 2015 18:48:03 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The first dependency of these targets is
> $(BUILD_DIR)/buildroot-config/*conf
> so the $(BUILD_DIR)/buildroot-config directory certainly exists.
> 
> Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Changes v1->v2:
> - Updated commit message with *conf, since it's sometimes qconf, nconf,
>   ... (Robert)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
