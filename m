From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 Nov 2017 20:37:44 +0100
Subject: [Buildroot] [PATCH] dbus: bump to version 1.12.0
In-Reply-To: <8ad470089db5ea9391181af416f64952559b76be.1509906257.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 5 Nov 2017 20:24:17 +0200")
References: <8ad470089db5ea9391181af416f64952559b76be.1509906257.git.baruch@tkos.co.il>
Message-ID: <87bmkg1ppz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Remove --enable-abstract-sockets; dropped upstream. Remove
 > ac_cv_have_abstract_sockets that is dropped as well.

 > Remove --disable-selinux; we handle selinux as an optional dependency
 > below.

 > Remove --{enable,disable}-dnotify; this options has been removed in
 > version 1.7.6, broken since 2010.

 > Remove --with-init-scripts; dropped upstream.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
