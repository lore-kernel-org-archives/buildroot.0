From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 17:05:23 +0100
Subject: [Buildroot] [PATCH v2] package/softether: bump to
 v4.28-9669-beta
In-Reply-To: <1549367272-15431-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Tue, 5 Feb 2019 05:47:52 -0600")
References: <1549367272-15431-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87h8dimda4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Source code is now compatible with OpenSSL 1.1.x.
 > Fixes
 > http://autobuild.buildroot.net/results/a6f/a6f1f326ce2525ee0f9d423f1b6d989a89e6b87e/build-end.log

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > ---
 > Changes
 > v1 -> v2
 >  - Added patch to fix RSA key size needing to be larger then 32bits for new openssl
 >  - Tested both host and target build

Committed after fixing up the DOS/UNIX newlines, thanks.

-- 
Bye, Peter Korsgaard
