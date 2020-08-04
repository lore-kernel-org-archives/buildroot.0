From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Aug 2020 13:40:24 +0200
Subject: [Buildroot] [PATCH] package/dropbear: bump to version 2020.79
In-Reply-To: <CAAXf6LVqrDFw9QQzjjnGFnSdb_BfBFj6bCnciZGjQHmM2D1nVQ@mail.gmail.com>
 (Thomas De Schampheleire's message of "Tue, 4 Aug 2020 12:15:41
 +0200")
References: <20200622073933.236001-1-francois.perrad@gadz.org>
 <87eeq78o4n.fsf@dell.be.48ers.dk>
 <CAAXf6LVqrDFw9QQzjjnGFnSdb_BfBFj6bCnciZGjQHmM2D1nVQ@mail.gmail.com>
Message-ID: <87bljqskpj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > Hi Peter,
 > El lun., 22 jun. 2020 a las 11:07, Peter Korsgaard (<peter@korsgaard.com>)
 > escribi?:

 >> >>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:
 >> 
 >> > CBC ciphers, 3DES and hmac-sha1-96 are now disabled by default.
 >> 
 >> Do we expect that to cause compatibility issues?
 >> 
 >> Committed, thanks.
 >> 


 > I just want to notify you that this dropbear release 2020.79 also contains
 > a security fix: (from the CHANGES file):

 >          - scp fix for CVE-2018-20685 where a server could modify name of
 > output files

 > and as such this update (or the later one to update to 2020.80) should also
 > be applied on the LTS branch.

Ahh yes, true. 2020.79 does bring quite some new features / changes
though, would a backport of the scp fix be feasible?

-- 
Bye, Peter Korsgaard
