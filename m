From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Aug 2019 13:49:02 +0200
Subject: [Buildroot] [PATCH v2] package/dhcp: fix target installation
In-Reply-To: <20190724105453.4233-1-unixmania@gmail.com>
 (unixmania@gmail.com's message of "Wed, 24 Jul 2019 07:54:53 -0300")
References: <20190724105453.4233-1-unixmania@gmail.com>
Message-ID: <87mug268nl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > We don't use "make install" for the target installation so we must pick
 > the executables from the ".libs" directories on which libtool generates
 > them otherwise we install the automatically generated wrapper scripts.

 > This was not necessary before the upgrade to version 4.4.1.

 > Fixes: https://bugs.busybox.net/show_bug.cgi?id=12051

Committed to 2019.05.x (2019.02.x does not use 4.4.1), thanks.

-- 
Bye, Peter Korsgaard
