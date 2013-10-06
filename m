From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Oct 2013 23:40:41 +0200
Subject: [Buildroot] [PATCHv2 04/21] toolchain: move helpers.mk into
	toolchain-external/
In-Reply-To: <20131006232608.432630fe@skate> (Thomas Petazzoni's message of
 "Sun, 6 Oct 2013 23:26:08 +0200")
References: <1381069171-29748-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381069171-29748-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <87a9imdwm5.fsf@dell.be.48ers.dk> <20131006232608.432630fe@skate>
Message-ID: <87k3hqcc2u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> git grep copy_toolchain package/
 >> package/glibc/glibc.mk:         $(call copy_toolchain_lib_root,$(STAGING_DIR)/,,

 Thomas> Oh, I'm impressed how well you know the code, even code that I have
 Thomas> written.

git grep is your friend ;)

 Thomas> We really need some kind of "test suite" to check patches or
 Thomas> something like that: a patch set such as this toolchain-related patch
 Thomas> set is really a pain to test in all the various possible conditions. I
 Thomas> did test the internal backend, but only with uClibc toolchain.

Yeah, but I'm afraid the only real way of testing things is to build the
various affected variants (internal uclibc/glibc + external).

 Thomas> I'll rework my patch series.

Great, thanks!

-- 
Bye, Peter Korsgaard
