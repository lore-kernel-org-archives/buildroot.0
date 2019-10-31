From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 15:15:16 +0100
Subject: [Buildroot] [PATCH v3] exfat,
 exfat-utils: fix the installation path of the helper, utilities
In-Reply-To: <20191027141538.1390a13b@windsurf.dhcp.lyon.intranet> (Thomas
 Petazzoni's message of "Sun, 27 Oct 2019 14:15:38 +0100")
References: <ffca193d-4266-0806-c766-930ab8330977@grandegger.com>
 <20191027141538.1390a13b@windsurf.dhcp.lyon.intranet>
Message-ID: <87eeytxaq3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Tue, 24 Sep 2019 14:29:20 +0200
 > Wolfgang Grandegger <wg@grandegger.com> wrote:

 >> "mount" from the "util-linux" package does expect the helper utilities
 >> in "/sbin" and not "/usr/sbin". We use "--exec-prefix=/" to fix the
 >> issue. The man-pages are then still installed under "/usr/share/man".
 >> 
 >> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
 >> ---

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
