From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 07 Sep 2013 08:09:54 +0200
Subject: [Buildroot] [PATCH 1 of 2 v3] infra: introduce
	suitable-extractor helper function
In-Reply-To: <bb19f03cbc968ff3c2a4.1375434314@BEANTN0L019720> (Thomas De
 Schampheleire's message of "Fri, 02 Aug 2013 11:05:14 +0200")
References: <patchbomb.1375434313@BEANTN0L019720>
 <bb19f03cbc968ff3c2a4.1375434314@BEANTN0L019720>
Message-ID: <87a9jp17t9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> In order to simplify determining the right extractor tool for a given
 Thomas> file type, this patch introduces a make function 'suitable-extractor'.
 Thomas> Its usage is $(call suitable-extractor,filename), and it returns the
 Thomas> path to the suitable extractor.

 Thomas> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 Thomas> ---
 Thomas> v3: Correct $(firstword) usage
 Thomas> (v2): new patch in series

Committed, thanks.

-- 
Bye, Peter Korsgaard
