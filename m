From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 21:58:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/softether: fix static build
 with openssl and atomic
In-Reply-To: <20190413084640.32444-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 13 Apr 2019 10:46:40 +0200")
References: <20190413084640.32444-1-fontaine.fabrice@gmail.com>
Message-ID: <87k1fj9nvt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Don't pass --with-openssl option to force softether to use pkg-config
 > (see autotools/ax_check_openssl.m4).

 > pkg-config will find openssl dependencies such as lz or latomic

 > Fix static build on sparc v8 (even if there is no autobuilder failures
 > yet)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
