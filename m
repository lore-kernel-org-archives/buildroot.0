From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Aug 2016 21:18:21 +0200
Subject: [Buildroot] [PATCH 3/3] system: move locale purging options to
	the "System configuration" menu
In-Reply-To: <1470176380-11851-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 3 Aug 2016 00:19:40 +0200")
References: <1470176380-11851-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1470176380-11851-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87y44dk6f6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The options to purge locales and to generate locale data are currently
 > located in the toolchain menu. However, these options are not really
 > related to the toolchain per-se, they are more system-level
 > configuration options, much like the timezone selection option we
 > already have in the "System configuration" menu.

 > Therefore, it makes more sense to have the locale-related options in
 > the "System configuration" menu as well.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
