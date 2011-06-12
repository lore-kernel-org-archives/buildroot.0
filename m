From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Jun 2011 21:55:21 +0200
Subject: [Buildroot] [PATCH 5/8] Mark some packages as not usable on
	non-MMU systems
In-Reply-To: <35ff9eeb8007f6f1586eaead5e36c1d83a165178.1306792524.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Mon, 30 May 2011 23:57:00 +0200")
References: <cover.1306792524.git.thomas.petazzoni@free-electrons.com>
	<cover.1306792524.git.thomas.petazzoni@free-electrons.com>
	<35ff9eeb8007f6f1586eaead5e36c1d83a165178.1306792524.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87r56y7rkm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/gpsd/Config.in               |    2 ++
 Thomas>  package/input-event-daemon/Config.in |    2 ++
 Thomas>  package/kbd/Config.in                |    2 ++
 Thomas>  package/setserial/Config.in          |    2 ++
 Thomas>  package/sysstat/Config.in            |    2 ++
 Thomas>  5 files changed, 10 insertions(+), 0 deletions(-)

Why exactly those? I would guess other packages have similar issues
(bash for one)?

-- 
Bye, Peter Korsgaard
