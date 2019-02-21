From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 11:44:31 +0100
Subject: [Buildroot] [PATCH] package/sqlcipher: force libopenssl
In-Reply-To: <1549982190-34082-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Tue, 12 Feb 2019 08:36:30 -0600")
References: <1549982190-34082-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87y369s9o0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > v3.2.0 has a bug in the configure step which causes it to fail when being
 > built against libressl. As libopenssl is selected as the default, the
 > autobuilders have not uncovered this failure. The issue has been confirmed
 > in LTS 2018.02.10 (probably broken prior to that as well) and is not
 > related to the Openssl bump to 1.1.x.

 > Thread with more details
 > http://lists.busybox.net/pipermail/buildroot/2019-February/243133.html

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
