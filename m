From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 Oct 2013 17:28:04 +0100
Subject: [Buildroot] [PATCH 2/3] fltk: bump to version 1.3.2
In-Reply-To: <1382914459-30545-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 27 Oct 2013 19:54:18 -0300")
References: <1382914459-30545-1-git-send-email-gustavo@zacarias.com.ar>
 <1382914459-30545-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877gcxs6ln.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/519/5195f7a8a38a5ba3ce5a0bf2a7649d390e461ee9/


 > The failure is related to bundled libpng conflicting with system libpng.
 > Which was a problem even before the libpng bump because the bundled
 > version for the previous fltk version has several security
 > vulnerabilities.
 > So disable bundled libraries and use global ones.

Committed, thanks.

-- 
Bye, Peter Korsgaard
