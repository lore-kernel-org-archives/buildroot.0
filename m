From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Sep 2015 23:46:18 +0200
Subject: [Buildroot] [PATCHv4 1/2] udisks: bump to version 1.0.5
In-Reply-To: <1441203680-29193-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Wed, 2 Sep 2015 15:21:19 +0100")
References: <1441203680-29193-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <871te9kimt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > This version depends on libgudev when using systemd, otherwise it fails
 > with an error like this one:

 > checking for GUDEV... no
 > configure: error: Package requirements (gudev-1.0 >= 147) were not met:

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed after changing the _CONF_OPTS to _DEPENDENCIES, thanks.

-- 
Bye, Peter Korsgaard
