From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 09 Oct 2012 09:40:05 +0200
Subject: [Buildroot] [PATCH 2/6] netkittelnet: convert to
	generic-package infrastructure
In-Reply-To: <1348266518-27665-3-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sat, 22 Sep 2012 00:28:34 +0200")
References: <1348266518-27665-1-git-send-email-s.martin49@gmail.com>
 <1348266518-27665-3-git-send-email-s.martin49@gmail.com>
Message-ID: <87391odrfu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Y Samuel> -netkittelnet: netkitbase $(TARGET_DIR)/$(NETKITTELNET_TARGET_BINARY)
 
You forgot to add netkitbase to _DEPENDENCIES, but I fixed that and
committed, thanks.

-- 
Bye, Peter Korsgaard
