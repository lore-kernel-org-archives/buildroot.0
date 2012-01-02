From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Jan 2012 23:03:25 +0100
Subject: [Buildroot] [PATCH 1/1] autotools: add escaping when using
	HOST_MAKE_ENV and TARGET_MAKE_ENV
In-Reply-To: <c91c50548194e19d2771900df958546f49f29b44.1324728420.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 24 Dec 2011 13:07:03 +0100")
References: <cover.1324728420.git.thomas.petazzoni@free-electrons.com>
 <cover.1324728420.git.thomas.petazzoni@free-electrons.com>
 <c91c50548194e19d2771900df958546f49f29b44.1324728420.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ty4dzrrm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Without this escaping, the evaluation of HOST_MAKE_ENV and
 Thomas> TARGET_MAKE_ENV is done when the AUTOTARGETS_INNER macro is defined,
 Thomas> not when it is instantiated by the various packages. The result is
 Thomas> that the $(PKG_CONFIG_HOST_BINARY) variable, used in $(HOST_MAKE_ENV)
 Thomas> gets expanded before it is defined.

Committed, thanks.

-- 
Bye, Peter Korsgaard
