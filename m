From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 21 Apr 2013 23:16:59 +0200
Subject: [Buildroot] [PATCH v2] libcurl: specify capath
In-Reply-To: <1366234287-8062-1-git-send-email-shawn7400@gmail.com> (Shawn
 J. Goff's message of "Wed, 17 Apr 2013 17:31:27 -0400")
References: <1366234287-8062-1-git-send-email-shawn7400@gmail.com>
Message-ID: <87d2tnh9dg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Shawn" == Shawn J Goff <shawn7400@gmail.com> writes:

 Shawn> From: "Shawn J. Goff" <shawn7400@gmail.com>

 Shawn> Since openssl's path is '/etc/ssl/' (specified in our openssl
 Shawn> package), we should also make sure that's what curl is using.

 Shawn> Previously, it's hasn't been specified, which means it changes
 Shawn> depending on the host system where it's compiled.

 Shawn> Signed-off-by: Shawn J. Goff <shawn7400@gmail.com>
 Shawn> ---

 Shawn> Moved the option inside the BR2_PACKAGE_OPENSSL conditional.

Committed, thanks.

-- 
Bye, Peter Korsgaard
