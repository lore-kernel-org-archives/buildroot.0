From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2016 22:48:41 +0100
Subject: [Buildroot] [PATCH] uclibc: update uClibc-ng to latest version
	1.0.11
In-Reply-To: <20160110175806.GA23441@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Sun, 10 Jan 2016 18:58:06 +0100")
References: <20160110175806.GA23441@waldemar-brodkorb.de>
Message-ID: <87d1t679l2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Update to 1.0.11. Contains a lot of bugfixes
 > and some new features:
 >  * mips{32r6,64r6} enablement
 >  * argp support
 >  * support for very simple /etc/gai.conf
 >  * Xtensa nommu vfork fix
 >  * systemd portability fixes

Does this mean that systemd can be now used with uClibc-NG?

Committed, thanks.

-- 
Bye, Peter Korsgaard
