From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 May 2015 09:00:32 +0200
Subject: [Buildroot] [PATCH 1/3] package/gnuchess: add gettext dependency
In-Reply-To: <1431289986-20427-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Sun, 10 May 2015 22:33:04 +0200")
References: <1431289986-20427-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87fv73k38v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > gnuchess check for libintl library if BR2_NEEDS_GETTEXT_IF_LOCALE is set.
 > checking for GNU gettext in libintl... yes
 > checking whether to use NLS... yes
 > checking where the gettext function comes from... external libintl
 > checking how to link with libintl... -lintl

 > But the dependency on gettext package is missing to ensures
 > reproducible builds.

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed all 3, thanks.

-- 
Bye, Peter Korsgaard
