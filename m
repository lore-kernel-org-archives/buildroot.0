From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 15 Aug 2014 12:05:58 +0200
Subject: [Buildroot] [PATCH v2] qt: don't install translation files by
	default
In-Reply-To: <1408091487-5340-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Fri, 15 Aug 2014 10:31:27 +0200")
References: <1408091487-5340-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87y4uq1309.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > Commit 93917b6980f7f2b51302e1a3fa451b07cf7d674e (2013.11) introduced
 > the installation of the binary .qm translation files, unconditionally.

 > However, the installed size is very large for some embedded systems
 > (about 8 MB), and they are not needed in many cases.

 > In order to avoid such a waste of storage space, commit
 > 2ff329412f490dc916bab3377073ef5950a46298 (2014.08) made this
 > installation an option that could be disabled. For backward
 > compatibility, the option default was set to yes.

 > Given the size of these files, and that they had never been installed
 > by Buildroot versions before 2013.11, change the default to not
 > installing them.

 > Interested users can still activate it as needed.

 > Also update and improve the help text.

 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 > Reviewed-by: Danomi Manchego <danomimanchego123@gmail.com>
 > Cc: Danomi Manchego <danomimanchego123@gmail.com>
 > Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
