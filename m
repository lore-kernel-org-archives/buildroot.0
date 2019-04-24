From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 21:54:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/libfreefare: fix static build
 with latomic
In-Reply-To: <20190412171045.18584-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 12 Apr 2019 19:10:45 +0200")
References: <20190412171045.18584-1-fontaine.fabrice@gmail.com>
Message-ID: <871s1rb2mo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Use pkg-config to retrieve openssl dependencies such as lz or latomic
 > Fixes:
 >  - http://autobuild.buildroot.org/results/9bf69f238a63ea28690f7c0dbb8c30feb0afc5ad

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
