From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 22:02:06 +0100
Subject: [Buildroot] [PATCH 1/7] Adding janus-gateway and dependencies
In-Reply-To: <1418158739-863-1-git-send-email-gregd72002@gmail.com>
References: <1418158739-863-1-git-send-email-gregd72002@gmail.com>
Message-ID: <20141209220206.4558485f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Dec 2014 20:58:59 +0000, kiwi wrote:
> This adds ding-libs
> 
> To be included:
> ding-libs
> gengetopt
> libnice
> libsrtp
> libwebsock
> sofia-sip
> janus-gateway
> 
> Signed-off-by: kiwi <gregd72002@gmail.com>

We need a real name here for the SoB, and also the author of the patch.

Also, when you previously submitted this, reviewers asked you to split
that into one patch per package, which isn't the case here. Could you
do this split, and resend an updated version? We will not be able to
review and apply this until you split it in several patches.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
