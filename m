From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Oct 2015 22:58:28 +0100
Subject: [Buildroot] [PATCH 1/1] Revert "package/swupdate: add patch to
	fix build issue with some toolchains"
In-Reply-To: <1445691845-17624-1-git-send-email-bjorn.forsman@gmail.com>
 (=?utf-8?Q?=22Bj=C3=B8rn?= Forsman"'s message of "Sat, 24 Oct 2015 15:04:05
 +0200")
References: <1445691845-17624-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <87egghb8cb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:

 > This patch caused an unfortunate regression that prevents any handlers
 > from being registered (runtime issue). This means swupdate cannot
 > perform any update. Upstream has reverted it.

 > See discussion:
 > https://groups.google.com/d/msg/swupdate/oVIhJmYPT8A/eq3uZvYVDQAJ

 > This reverts commit a8cc6eeec5a665db5689083312beef14a9afbafa.

 > Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
