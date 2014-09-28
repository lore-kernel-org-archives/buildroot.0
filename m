From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Sep 2014 21:11:35 +0200
Subject: [Buildroot] [PATCH v2 4/5] package/cdrkit: clean {HOST_,
	}CDRKIT_CONF_OPT
In-Reply-To: <1408653920-18954-5-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Thu, 21 Aug 2014 22:45:19 +0200")
References: <1408653920-18954-1-git-send-email-s.martin49@gmail.com>
 <1408653920-18954-5-git-send-email-s.martin49@gmail.com>
Message-ID: <871tqvwoew.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > Extending {C,LD}FLAGS for both host and target cdrkit package is not needed
 > because it is already handled by the {host-,}cmake-package infrastructure.

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

No longer applied, but I've fixed it up and committed, thanks.

-- 
Bye, Peter Korsgaard
