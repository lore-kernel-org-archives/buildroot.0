From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Mar 2018 22:33:41 +0100
Subject: [Buildroot] [PATCH] x11vnc: add license hash
In-Reply-To: <87zi3hgct6.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Fri, 09 Mar 2018 22:27:01 +0100")
References: <20180309123053.21552-1-martink@posteo.de>
 <87zi3hgct6.fsf@dell.be.48ers.dk>
Message-ID: <87sh99gci2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Martin" == Martin Kepplinger <martink@posteo.de> writes:
 >> Signed-off-by: Martin Kepplinger <martink@posteo.de>

 > Committed, thanks.

Ehh, I take that back. My x11vnc-0.9.15 tarball does not have a COPYING
file:

make x11vnc-patch
x11vnc-0.9.15.tar.gz: OK (sha256: 3e43bd875edc3c7f52a0d3676c4ec7de910fcd210240ee20b4522deb2bf84cff)
>>> x11vnc 0.9.15 Extracting
gzip -d -c /var/lib/downloads/x11vnc-0.9.15.tar.gz | tar --strip-components=1 -C /home/peko/source/buildroot/output/build/x11vnc-0.9.15   -xf -
>>> x11vnc 0.9.15 Patching
>>> x11vnc 0.9.15 Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find /home/peko/source/buildroot/output/build/x11vnc-0.9.15 -name $file); do cp support/gnuconfig/$file $i; done; done
ls output/build/x11vnc-0.9.15
AUTHORS     configure.ac  misc    README.md                                      tkx11vnc
autogen.sh  m4            NEWS    src                                            x11vnc.1
ChangeLog   Makefile.am   README  tightvnc-1.3dev5-vncviewer-alpha-cursor.patch  x11vnc.desktop

What went wrong?

-- 
Bye, Peter Korsgaard
