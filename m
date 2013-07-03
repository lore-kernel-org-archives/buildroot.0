From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 03 Jul 2013 23:31:57 +0200
Subject: [Buildroot] [PATCH 08/23] kernel-headers: migrate to the
	package infrastructure
In-Reply-To: <20130703232405.3b60a57a@skate> (Thomas Petazzoni's message of
 "Wed, 3 Jul 2013 23:24:05 +0200")
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1372620553-11416-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <20130703232405.3b60a57a@skate>
Message-ID: <87ehbfpbxu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> +config BR2_PACKAGE_HOST_LINUX_HEADERS
 >> +	bool

 Thomas> Now that I read this again, I'm wondering why I've added this dummy
 Thomas> hidden Config.in option. It seems useless, no?

Hmm, yes I think it is.

-- 
Bye, Peter Korsgaard
