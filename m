From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 05 Oct 2019 08:06:10 +0200
Subject: [Buildroot] [PATCH 2/2] package/cups-filters: fix ln -r
 workaround for older distributions
In-Reply-To: <20191005024230.25287-3-unixmania@gmail.com> (unixmania's message
 of "Fri, 4 Oct 2019 23:42:30 -0300")
References: <20191005024230.25287-1-unixmania@gmail.com>
 <20191005024230.25287-3-unixmania@gmail.com>
Message-ID: <87eezr20bx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > Add a patch to create the ln-srf script that was not included in the
 > 1.25.6 release tarball. Also add a post-patch hook to ensure that the
 > script executable, since but GNU patch < 2.7 does not handle the git
 > patch permission extensions.

 > Fixes:
 >   http://autobuild.buildroot.net/results/c78e7d6d703b1b48ba19d8c4fae32b4e4489cb43/

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
