From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Feb 2018 20:45:34 +0100
Subject: [Buildroot] [PATCH next] iw: bump to version 4.14
In-Reply-To: <bd63f8c762f0043a583dfb093c87c445af65365d.1519844472.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 28 Feb 2018 21:01:12 +0200")
References: <bd63f8c762f0043a583dfb093c87c445af65365d.1519844472.git.baruch@tkos.co.il>
Message-ID: <87k1uwkie9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Drop IW_MAKE_OPTS, passing the CC, LD, and LDFLAGS in the environment
 > via TARGET_CONFIGURE_OPTS is enough.

 > Add license file hash.

 > Cc: Matt Weber <matthew.weber@rockwellcollins.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
