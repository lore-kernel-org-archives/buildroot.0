From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2016 11:59:09 +0100
Subject: [Buildroot] [PATCH] package/mono: fixing monodoc leaking path
In-Reply-To: <1456438127-15919-1-git-send-email-angelo.compagnucci@gmail.com>
 (Angelo Compagnucci's message of "Thu, 25 Feb 2016 23:08:47 +0100")
References: <1456438127-15919-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <87lh66s9ky.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > This patch fixes a leak in host compiler path for monodoc.
 > This bug is solved upstream but the fix is not included
 > in the latest stable release.

 > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
