From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Apr 2012 11:23:38 +0200
Subject: [Buildroot] [PATCH] Add sam-ba to at91sam926*_defconfig
In-Reply-To: <1334149610-989-1-git-send-email-alexandre.belloni@piout.net>
 (Alexandre Belloni's message of "Wed, 11 Apr 2012 15:06:50 +0200")
References: <1334149610-989-1-git-send-email-alexandre.belloni@piout.net>
Message-ID: <87d379bb6t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexandre" == Alexandre Belloni <alexandre.belloni@piout.net> writes:

 Alexandre> Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
 Alexandre> ---
 Alexandre>  configs/at91sam9260dfc_defconfig |    4 ++++
 Alexandre>  configs/at91sam9261ek_defconfig  |    5 +++++
 Alexandre>  configs/at91sam9263ek_defconfig  |    4 ++++
 Alexandre>  3 files changed, 13 insertions(+), 0 deletions(-)

You forgot 9g20dfc. I've fixed that and committed, thanks.

-- 
Bye, Peter Korsgaard
