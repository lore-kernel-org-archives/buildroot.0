From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Jun 2014 14:31:35 +0200
Subject: [Buildroot] [PATCH v2 1/1] simicsfs: new package
In-Reply-To: <1402453184-4851-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Tue, 10 Jun 2014 19:19:44 -0700")
References: <1402453184-4851-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87sin9dm8o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

Committed with the upstream url changed to http as wget complains here
about the certificate, thanks:

>>> simicsfs 1.17 Downloading
--2014-06-13 14:27:54--  https://download.simics.net/pub/simicsfs-1.17.tar.gz
Resolving download.simics.net (download.simics.net)... 192.124.127.195
Connecting to download.simics.net (download.simics.net)|192.124.127.195|:4 .. connected.
ERROR: The certificate of ?download.simics.net? is not trusted.
ERROR: The certificate of ?download.simics.net? hasn't got a known issuer.

-- 
Bye, Peter Korsgaard
