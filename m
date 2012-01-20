From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Jan 2012 09:19:57 +0100
Subject: [Buildroot] [PATCH v4] bash: Adding features that can not be
	automatically detected while cross-compiling
In-Reply-To: <1326975728-25580-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Thu, 19 Jan 2012 13:22:08 +0100")
References: <CA+gTGJGnxMiY9NKWhFsvsKhZT95N2QV_V2-XzDMN7aJMZRo3uA@mail.gmail.com>
 <1326975728-25580-1-git-send-email-arnout@mind.be>
Message-ID: <87obtyiy4y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> There are some bash features that can not be detected automatically during
 Arnout> configure stage while cross-compiling. This commit forces them on.

 Arnout> Signed-off-by: Arkady Gilinsky <arcadyg@gmail.com>
 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks both.

-- 
Bye, Peter Korsgaard
