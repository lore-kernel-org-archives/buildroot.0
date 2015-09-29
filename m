From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Sep 2015 00:35:35 +0200
Subject: [Buildroot] [PATCH 2/2] postgresql: fix ZIC configure variable
	assignment
In-Reply-To: <7faff32466eadac25bc783c3f81f5f2e5f353815.1443556892.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 29 Sep 2015 23:01:32 +0300")
References: <b782d1949e86cb4f2479ffac8fc47dffda0d1b9f.1443556892.git.baruch@tkos.co.il>
 <7faff32466eadac25bc783c3f81f5f2e5f353815.1443556892.git.baruch@tkos.co.il>
Message-ID: <87k2r8yhu0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The 'ZIC=$$(ZIC)' assignment is seen as 'ZIC=$(ZIC)' by the shell, that
 > interprets that as command substitution causing an error like:

 > /bin/sh: ZIC: command not found

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
