From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Jan 2011 17:27:52 +0100
Subject: [Buildroot] [PATCH 1/4] libpcap: update static handling
In-Reply-To: <20110124171642.6cff75a4@surf> (Thomas Petazzoni's message of
	"Mon, 24 Jan 2011 17:16:42 +0100")
References: <1295493022-4659-1-git-send-email-vapier@gentoo.org>
	<1295493032-4705-1-git-send-email-vapier@gentoo.org>
	<877hdvapq0.fsf@macbook.be.48ers.dk>
	<201101231607.30938.vapier@gentoo.org> <20110124171642.6cff75a4@surf>
Message-ID: <87lj2atgfr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> So in your case you probably need to do something like:

 Thomas> LIBPCAP_INSTALL_STAGING_OPT = DYEXT=none DESTDIR="$(STAGING_DIR)" install
 Thomas> LIBPCAP_INSTALL_TARGET_OPT  = DYEXT=none DESTDIR="$(TARGET_DIR)" install

And presumably only for the BR2_PREFER_STATIC_LIB case.

-- 
Bye, Peter Korsgaard
