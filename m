From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 01:20:49 +0200
Subject: [Buildroot] [PATCH 1/1] redis: needs dynamic library
In-Reply-To: <20181023195521.22600-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 23 Oct 2018 21:55:21 +0200")
References: <20181023195521.22600-1-fontaine.fabrice@gmail.com>
Message-ID: <87pnw0ckry.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > dlfcn.h is included in src/debug.c and src/module.c
 > module.c uses dlopen function

 > Fixes:
 >  - http://autobuild.buildroot.org/results/fdda0ee7461dfc9ea479d4d80ab42c50006a3b13

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
