From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Nov 2020 20:31:25 +0100
Subject: [Buildroot] [PATCH] Revert "keepalived: needs headers >= 3.4"
In-Reply-To: <20201101234810.10137-1-vadym.kochan@plvision.eu> (Vadym Kochan's
 message of "Mon, 2 Nov 2020 01:48:10 +0200")
References: <20201101234810.10137-1-vadym.kochan@plvision.eu>
Message-ID: <87r1p3wsqa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vadym" == Vadym Kochan <vadym.kochan@plvision.eu> writes:

 > This reverts commit d01b0bbad04b97a5e8e1dd3ac3c1026555f793fb.
 > Original commit  made restriction for Linux headers < 3.4 which was
 > related to keepalived version 1.3.5, but it compiles fine now at least
 > with a toolchain based on 3.2 headers and keepalived 2.0.15 together
 > with ipset enabled.

 > Probably it was fixed by this commit:

 >     https://github.com/acassen/keepalived/commit/5a7f895bb795269f79e6353c6269dfbc0b782281

 > Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
