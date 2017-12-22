From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Dec 2017 15:40:25 +0100
Subject: [Buildroot] [PATCH 1/2] cryptsetup: bump to version 2.0.0
In-Reply-To: <81e71fbdb42aa4e00f16de0225eb5a0b6b17a79d.1513944202.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 22 Dec 2017 14:03:21 +0200")
References: <81e71fbdb42aa4e00f16de0225eb5a0b6b17a79d.1513944202.git.baruch@tkos.co.il>
Message-ID: <87608yygfa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add the now mandatory json-c depencecy. Propagate to reverse
 > dependencies.

 > Drop the no longer needed patch.

 > Add license files hashes.

 > Cc: Martin Hicks <mort@bork.org>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed after propagating the _HAS_SYNC_4 dependency to the comments, thanks.

-- 
Bye, Peter Korsgaard
