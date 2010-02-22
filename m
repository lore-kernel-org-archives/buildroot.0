From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Feb 2010 16:56:45 +0100
Subject: [Buildroot] [PATCH 10/16] xfont_font-util: convert to the
	autotools infrastructure
In-Reply-To: <f0655171e21a813a1fa784d06962c25267eac7e7.1266691382.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sat, 20 Feb 2010 19:43:01 +0100")
References: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<f0655171e21a813a1fa784d06962c25267eac7e7.1266691382.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87vddpi7r6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 Thomas> +XFONT_FONT_UTIL_POST_INSTALL_STAGING_HOOKS += XFONT_FONT_UTIL_POST_INSTALL_FIXES
 
 Thomas> +$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-util))
 Thomas> \ No newline at end of file

Here as well.

-- 
Bye, Peter Korsgaard
