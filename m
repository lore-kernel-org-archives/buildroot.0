From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 17:23:30 +0200
Subject: [Buildroot] [PATCH 2/2] scripts/graph-build-time: properly warn
	about missing modules
In-Reply-To: <1413111142-17643-2-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Sun, 12 Oct 2014 12:52:22 +0200")
References: <1413111142-17643-1-git-send-email-luca@lucaceresoli.net>
 <1413111142-17643-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <87lholwbv1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > Currently the graph-build-time script prints a python exception if a
 > needed module cannot be imported. Catch the exception and tell the user
 > which packages are missing, as we do for other missing dependencies.

 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
