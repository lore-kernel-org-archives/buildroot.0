From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 09 Aug 2018 23:58:38 +0200
Subject: [Buildroot] busybox update 1.29.x on LTS branch?
In-Reply-To: <20180731112158.GY21354@australia> (Thomas De Schampheleire's
 message of "Tue, 31 Jul 2018 13:21:58 +0200")
References: <20180731112158.GY21354@australia>
Message-ID: <87r2j7dwxd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <thomas.de_schampheleire@nokia.com> writes:

 > Hi Peter,
 > Busybox 1.29.x is fixing CVE issues, like https://nvd.nist.gov/vuln/detail/CVE-2018-1000517
 > and https://nvd.nist.gov/vuln/detail/CVE-2018-1000500, both fixed in 1.29.0.

 > I was wondering if you are planning on bumping busybox on the LTS branch too?

It is certainly a possibility. CVE-2018-1000500 is IMHO not really an
issue (simply a feature not implemented yet), but 100517 may be.

Step 1 is probably to bump master to the recently released 1.29.2. I'll
work on that now.

-- 
Bye, Peter Korsgaard
