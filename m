From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 25 Mar 2013 19:37:18 +0100
Subject: [Buildroot] [PATCH] dnsmasq: add missing dependency on
	host-gettext
In-Reply-To: <1364236301-25553-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 25 Mar 2013 19:31:41 +0100")
References: <1364236301-25553-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87obe7ba1t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> When idn support is enabled, the dnsmasq build procedure requires
 Thomas> xgettext, which is provided by host-gettext.

 Thomas> Moreover, dnsmasq.mk was not passing $(TARGET_MAKE_ENV) in the
 Thomas> environment, so $(HOST_DIR)/usr/bin was not in the PATH. For that
 Thomas> reason, the dnsmasq Makefile could not find the xgettext program.

Committed, thanks.

-- 
Bye, Peter Korsgaard
