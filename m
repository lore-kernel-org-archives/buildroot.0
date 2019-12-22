From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 21:15:25 +0100
Subject: [Buildroot] [PATCH] busybox: Don't overwrite existing inittab
In-Reply-To: <20191206123154.26102-1-paul@crapouillou.net> (Paul Cercueil's
 message of "Fri, 6 Dec 2019 13:31:54 +0100")
References: <20191206123154.26102-1-paul@crapouillou.net>
Message-ID: <87y2v4yv4y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Cercueil <paul@crapouillou.net> writes:

 > If a inittab file was already provided in the skeleton, don't overwrite
 > it with the one that comes with the busybox package.

 > Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
