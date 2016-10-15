From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 11:46:52 +0200
Subject: [Buildroot] [PATCH] bind: bump version to 9.11.0
In-Reply-To: <20161011125423.38125-1-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Tue, 11 Oct 2016 13:54:23 +0100")
References: <20161011125423.38125-1-Vincent.Riera@imgtec.com>
Message-ID: <874m4eosfn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > - With the release of BIND 9.11.0, ISC is changing the open source
 >   license for BIND from the ISC license to the Mozilla Public License
 >   (MPL 2.0). See release notes:
 >   http://ftp.isc.org/isc/bind9/9.11.0/RELEASE-NOTES-bind-9.11.0.html

 > - Explicitly enable/disable zlib support, otherwise the configure script
 >   will fail like this:

 >   checking for zlib library... yes
 >   checking for library containing deflate... no
 >   configure: error: found zlib include but not library.

Committed, thanks.

-- 
Bye, Peter Korsgaard
