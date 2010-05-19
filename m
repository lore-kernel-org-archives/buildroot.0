From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 May 2010 13:54:53 +0200
Subject: [Buildroot] change of staging_dir paths ?
In-Reply-To: <20100519121553.1f26cf56@surf> (Thomas Petazzoni's message of
	"Wed, 19 May 2010 12:15:53 +0200")
References: <2040226006DA4CF38CBF75F437EF92EC@apexjs>
	<20100519121553.1f26cf56@surf>
Message-ID: <87aarwxg1e.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> buildroot/output/build/staging_dir/usr/bin
 >> but  now is
 >> buildroot/output/staging/usr/bin  
 >> 
 >> Has this changed in 2010.05rc2 ? 

 Thomas> No, it has changed since 2009.08.

But we only changed the default value of BR2_STAGING_DIR, so it only
comes into effect if you start over with a new config rather than
reusing an old one.

-- 
Bye, Peter Korsgaard
