From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Apr 2021 15:01:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/bridge-utils: fix build on musl
In-Reply-To: <20210411081528.189137-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 11 Apr 2021 10:15:28 +0200")
References: <20210411081528.189137-1-fontaine.fabrice@gmail.com>
Message-ID: <875z0bvnsr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build on musl is broken since bump to version 1.7.1 in commit
 > 5f2d38df4f85f7999cf6d00da089991cba93fee6

 > Fixes:
 >  - http://autobuild.buildroot.org/results/0f080ff6913595ee2732b93206e5001c837c1bcc

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
