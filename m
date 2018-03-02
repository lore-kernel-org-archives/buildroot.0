From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Mar 2018 08:37:26 +0100
Subject: [Buildroot] [PATCH master] dash: fix build with musl
In-Reply-To: <d86e4eb5defd3f473f9aa443428c4bf48dd225cb.1519972872.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 2 Mar 2018 08:41:12 +0200")
References: <d86e4eb5defd3f473f9aa443428c4bf48dd225cb.1519972872.git.baruch@tkos.co.il>
Message-ID: <87d10ndj2h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > musl libc requires the getopt.h header for the definition of 'optreset'.
 > Fixes:
 > http://autobuild.buildroot.net/results/c23/c233ade479d6124ed7b382f2aa9859fe509d7bca/
 > http://autobuild.buildroot.net/results/081/0813c13c2a978316e6fa9a3cdbd5512612f5c374/
 > http://autobuild.buildroot.net/results/182/18230384d8225fbd7fddabfcbd685eaa38e31b31/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
