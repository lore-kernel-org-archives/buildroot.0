From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Mar 2018 18:11:21 +0200
Subject: [Buildroot] [PATCH v2] gawk: bump to version 4.2.1
In-Reply-To: <d4d06a0eadf0455d927974974cae855eb5f1738d.1522275121.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 29 Mar 2018 01:12:01 +0300")
References: <d4d06a0eadf0455d927974974cae855eb5f1738d.1522275121.git.baruch@tkos.co.il>
Message-ID: <87in9e980m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Enable static build. gawk builds statically just fine. The shared
 > library check has been removed in 4.1.1.

 > Remove the symlink force hunk from the no-versioned patch. The only user
 > of LN is in the part that this patch disables.

 > Add license file hash.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v2: Update dependency comment text

Committed, thanks.

-- 
Bye, Peter Korsgaard
