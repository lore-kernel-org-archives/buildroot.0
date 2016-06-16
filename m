From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 22:43:14 +0200
Subject: [Buildroot] [PATCH] package/bullet: add .hash file
In-Reply-To: <1466108879-6363-1-git-send-email-romain.naour@gmail.com> (Romain
 Naour's message of "Thu, 16 Jun 2016 22:27:59 +0200")
References: <1466108879-6363-1-git-send-email-romain.naour@gmail.com>
Message-ID: <878ty49865.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Similar to jquery-keyboard, it seems the bullet tarball on the autobuilder
 > is corrupt.  Fix it by adding a .hash file so it falls back to our s.b.o
 > mirror.

 > Fixes:
 > http://autobuild.buildroot.net/results/39b/39bb344e3631e5f8872336cef981db5c6ec382c1

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
