From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 15 Apr 2013 23:47:38 +0200
Subject: [Buildroot] [PATCH 1/2] qt5: factor <pkg>_SITE variable
In-Reply-To: <1366031480-9458-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 15 Apr 2013 15:11:19 +0200")
References: <1366031480-9458-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mwszlb45.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Each qt5 package was defining its own QT5<something>_SITE
 Thomas> variable. Unfortunately, the download location has slightly changed
 Thomas> for Qt 5.0.2, so we would have to change it for all packages. Instead,
 Thomas> we factor the <pkg>_SITE variable as QT5_SITE in package/qt5/qt5.mk,
 Thomas> just like we already do for QT5_VERSION.

Committed both, thanks.

-- 
Bye, Peter Korsgaard
