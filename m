From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Nov 2020 11:45:19 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/s390-tools: fix zkey build
In-Reply-To: <20201111092120.180866-1-egorenar@linux.ibm.com> (Alexander
 Egorenkov's message of "Wed, 11 Nov 2020 10:21:20 +0100")
References: <20201111092120.180866-1-egorenar@linux.ibm.com>
Message-ID: <87a6vomatc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Egorenkov <egorenar@linux.ibm.com> writes:

 > Linking of libekmfweb fails when zkey-ekmfweb.so build is enabled.
 > Fixes:
 > - http://autobuild.buildroot.net/results/d41bca3be35d1a48f962be03920f2b81c3e9bb9f

 > Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
 > ---

 > v1 -> v2:
 >  * Added autobuild link

Committed, thanks.

-- 
Bye, Peter Korsgaard
