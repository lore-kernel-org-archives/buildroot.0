From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 06 Sep 2014 22:16:16 +0200
Subject: [Buildroot] [PATCH] cppcms: really depend on wchar
In-Reply-To: <1410012273-17374-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 6 Sep 2014 16:04:33 +0200")
References: <1410012273-17374-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8738c4o67j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > In commit f8993ebb34823b301ea2bf4f1f57495ec29b906b ("cppcms: needs
 > wchar support even without icu"), Peter wanted to move the wchar
 > dependency from the ICU sub-option of cppcms to the main cppcms option
 > itself. However, for some reason it didn't do the entire change, and
 > the commit was lacking:

 >  * Removing the wchar dependency from BR2_PACKAGE_CPPCMS_ICU

 >  * Adding the wchar dependency to BR2_PACKAGE_CPPCMS.

 > It was only handling the two comments.

 > This should really fix:

 >   http://autobuild.buildroot.net/results/6f8/6f8e8b68235f6cf0dfef13e3ed11f97a3ab50a06/

Argh, wonder how that happened? Anyway - Committed, thanks.

-- 
Bye, Peter Korsgaard
