From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 22:18:09 +0200
Subject: [Buildroot] [PATCH 1/2] package/stunnel: fix static build with
 openssl and atomic
In-Reply-To: <20190411211250.9402-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 11 Apr 2019 23:12:49 +0200")
References: <20190411211250.9402-1-fontaine.fabrice@gmail.com>
Message-ID: <87lfzz88e6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Use pkg-config to find openssl dependencies such as lz or latomic
 > Fixes:
 >  - http://autobuild.buildroot.org/results/28a466b98f813edb6402686cc4706766e73e1ff3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
