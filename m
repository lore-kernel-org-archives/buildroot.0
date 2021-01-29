From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2021 09:28:21 +0100
Subject: [Buildroot] [PATCH] package/chrony: fix build with kernel
 headers older than 3.15
In-Reply-To: <232b243f475d862a443c2095b5155c427f5f5be9.1611845016.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 28 Jan 2021 16:43:36 +0200")
References: <232b243f475d862a443c2095b5155c427f5f5be9.1611845016.git.baruch@tkos.co.il>
Message-ID: <87sg6kxi3e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add a patch to make renameat2 system call reference conditional.
 > Fixes:
 > http://autobuild.buildroot.net/results/bb6/bb638ed011aea379c7f780187dafe2615753e2ae/
 > http://autobuild.buildroot.net/results/5ef/5ef11bace60950b35b4a593d734a20df088c79aa/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
