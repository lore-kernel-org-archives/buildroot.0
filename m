From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 21:40:12 +0100
Subject: [Buildroot] [PATCH 1/2] libssh2: fix pkg-config info for
 mbedtls backend
In-Reply-To: <85f6746ec9845fe4c5cd366cdd3345d08771165f.1521571596.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 20 Mar 2018 20:46:35 +0200")
References: <85f6746ec9845fe4c5cd366cdd3345d08771165f.1521571596.git.baruch@tkos.co.il>
Message-ID: <878tahyzpv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The libssh2.pc file did not contain the needed info for static link with
 > libssh2. Add a patch fixing that.

 > Fixes (qemu):
 > http://autobuild.buildroot.net/results/634/6346b25be2844f9ef722e52040ac1b43d9c38899/

 > Cc: Matt Weber <matthew.weber@rockwellcollins.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
