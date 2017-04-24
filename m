From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 21:22:27 +0200
Subject: [Buildroot] [PATCH v4 2/2] systemd: select fsck wrapper from
	util-linux
In-Reply-To: <1491231996-2461-3-git-send-email-casantos@datacom.ind.br>
 (Carlos Santos's message of "Mon, 3 Apr 2017 12:06:36 -0300")
References: <1491231996-2461-1-git-send-email-casantos@datacom.ind.br>
 <1491231996-2461-3-git-send-email-casantos@datacom.ind.br>
Message-ID: <87zif5wqz0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > Select the fsck required by systemd provided by util-linux. This
 > prevents ending up with fsck from busybox, which is incompatible
 > with systemd.

 > Change-Id: I61cfc9b8925169b2678ac911fcd5a4eb5d92c425
 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
