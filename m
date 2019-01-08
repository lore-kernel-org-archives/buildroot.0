From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Jan 2019 21:09:25 +0100
Subject: [Buildroot] [PATCH] package/strace: fix build for no-MMU targets
In-Reply-To: <8492328072f7e89d827805005e17390ddd88b4ee.1546966023.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 8 Jan 2019 18:47:03 +0200")
References: <8492328072f7e89d827805005e17390ddd88b4ee.1546966023.git.baruch@tkos.co.il>
Message-ID: <878szuud1m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The latest strace version bump added a call to fork() which breaks build
 > for no-MMU. Add a patch that removes the unneeded fork() call on no-MMU.

 > Fixes:
 > http://autobuild.buildroot.net/results/4a0/4a0e2872b27be93f73137c7550eae1c1f479c160/
 > http://autobuild.buildroot.net/results/747/74711084a54dfc17ad0d4d1e5faabf6d8a605dca/

 > Cc: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
