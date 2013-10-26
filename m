From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 26 Oct 2013 12:13:38 +0200
Subject: [Buildroot] [PATCH v3 1/2] docker: change into generic-package
In-Reply-To: <1382567059-30569-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Thu, 24 Oct 2013 00:24:18 +0200")
References: <1382567059-30569-1-git-send-email-arnout@mind.be>
Message-ID: <87mwlw2vcd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > docker is using autotools-package while it is in fact just a plain make
 > package.

 > Remove docker-1.5-skip-configure.patch which was just a hack to avoid
 > calling the non-existent configure script.

 > Remove docker-1.5-pkgconfig.patch which is not needed when PATH is set
 > appropriately.

 > Add a XLIBPATH option to the command line to avoid linking with
 > /usr/X11R6/lib.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 > I discovered this while testing Fabio's parallel make patches: the
 > changed dependency on .stamp_configured made the build fail.

 > v3: fixed splitting of the patches.

Committed both, thanks.

-- 
Bye, Peter Korsgaard
