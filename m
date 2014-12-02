From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Dec 2014 09:40:49 +0100
Subject: [Buildroot] [PATCH] ifplugd: remove spurious newline excape
In-Reply-To: <fb06c6bb75e7486b104103ed0de58d64fa3f2058.1417503529.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 2 Dec 2014 08:58:49 +0200")
References: <fb06c6bb75e7486b104103ed0de58d64fa3f2058.1417503529.git.baruch@tkos.co.il>
Message-ID: <87sigy30mm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Commit 5ad5d55924bcc (ifplugd: install configuration files unconditionally)
 > removed the conditional configuration file install, but left an redundant
 > newline escape, causing the following error:

 > package/ifplugd/ifplugd.mk:23: *** missing 'endef', unterminated 'define'.  Stop.

 > Fix this.

 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks - And sorry.

-- 
Bye, Peter Korsgaard
