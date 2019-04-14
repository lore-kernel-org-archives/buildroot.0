From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Apr 2019 23:21:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/tor: fix static build with
 openssl and atomic
In-Reply-To: <20190409210652.26052-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 9 Apr 2019 23:06:52 +0200")
References: <20190409210652.26052-1-fontaine.fabrice@gmail.com>
Message-ID: <87r2a4ffk9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Update patch so -latomic (provided in LIBS) is added after openssl libs
 > (provided in $3)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/4b90b7d02e354ebf3d8f95023547bf4a18e0165e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
