From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 00:00:09 +0100
Subject: [Buildroot] [PATCH 1/1] lcdproc: use ac_cv_mtab_file
In-Reply-To: <20181027210114.8662-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 27 Oct 2018 23:01:14 +0200")
References: <20181027210114.8662-1-fontaine.fabrice@gmail.com>
Message-ID: <8736s4y45i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Set ac_cv_mtab_file to /etc/mtab otherwise build will fail if no mtab,
 > mnttab or fstab is found in /etc (on host)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/efaf2833d674c7e366c59f367f0b83c7f88546bb

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
