From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 18:37:41 +0200
Subject: [Buildroot] [PATCH v5 09/19] python2: remove full path from .pyc
In-Reply-To: <1482241596-31688-10-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-10-git-send-email-jezz@sysmic.org>
Message-ID: <20170401183741.79c137ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Dec 2016 14:46:26 +0100, J?r?me Pouiller wrote:
> .pyc files include path to source .py file. This patch changes the way
> `pycompile.py' is launched in order to only keep the part relative to
> $TARGET_DIR.
> 
> This work was sponsored by `BA Robotic Systems'.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
