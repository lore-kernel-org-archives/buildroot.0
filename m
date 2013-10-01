From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Oct 2013 21:59:09 +0200
Subject: [Buildroot] [PATCH 2 of 2] make clean: remove redundant removal
	of STAGING_DIR
In-Reply-To: <e4d1fd22ccc32a9c0ffc.1380539367@argentina> (Thomas De
 Schampheleire's message of "Mon, 30 Sep 2013 13:09:27 +0200")
References: <patchbomb.1380539365@argentina>
 <e4d1fd22ccc32a9c0ffc.1380539367@argentina>
Message-ID: <87fvsku5iq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 Thomas> Since STAGING_DIR is defined as (package/Makefile.in):
 Thomas> STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
 Thomas> STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)

 Thomas> removing HOST_DIR will automatically remove STAGING_DIR. This
 Thomas> patch updates 'make clean' based on this knowledge.

 Thomas> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
