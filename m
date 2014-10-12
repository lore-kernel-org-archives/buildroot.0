From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 18:32:38 +0200
Subject: [Buildroot] [PATCHv2 1/2] getent: new package
In-Reply-To: <543A9CC0.7020802@mind.be> (Arnout Vandecappelle's message of
 "Sun, 12 Oct 2014 17:22:40 +0200")
References: <1408355649-28891-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1408355649-28891-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <543A9CC0.7020802@mind.be>
Message-ID: <87r3yduu3d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 18/08/14 11:54, Thomas Petazzoni wrote:
 >> The ecryptfs-utils scripts require the 'getent' program to be
 >> installed to find the home directory of users. However, Buildroot
 >> currently never installs this program, and therefore bug #7142 was
 >> reported, explaining that ecryptfs-utils is not working properly.
 >> 
 >> This solution allows to install a NSS-capable getent when glibc/eglibc
 >> is used, and otherwise to rely on uClibc's wrapper script.
 >> 
 >> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 >  Fixes a (run-time) bug, so please apply.

Committed, thanks.

-- 
Bye, Peter Korsgaard
