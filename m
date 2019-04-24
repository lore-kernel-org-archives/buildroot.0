From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 21:55:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/pure-ftpd: fix static build
 with openssl and latomic
In-Reply-To: <20190412212529.23242-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 12 Apr 2019 23:25:29 +0200")
References: <20190412212529.23242-1-fontaine.fabrice@gmail.com>
Message-ID: <87wojj9nzq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Use pkg-config to find openssl dependencies such as lz or latomic
 > Fixes:
 >  - http://autobuild.buildroot.org/results/eba8d344446b0db6327c0588c456c14594984f76

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
