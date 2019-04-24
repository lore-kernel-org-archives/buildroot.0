From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 22:31:03 +0200
Subject: [Buildroot] [PATCH] package/tpm2-tss: bump version to 2.1.3
In-Reply-To: <20190416201404.908-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 16 Apr 2019 22:14:04 +0200")
References: <20190416201404.908-1-peter@korsgaard.com>
Message-ID: <87imv36t88.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes a number of issues discovered post-2.1.2. For details, see:
 > https://github.com/tpm2-software/tpm2-tss/releases/tag/2.1.3

 > Drop 002-configure.ac-switch-default-ESAPI-crypto-backend-to-.patch as this
 > issue is now fixed upstream.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
