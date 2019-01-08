From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Jan 2019 16:12:51 +0100
Subject: [Buildroot] [PATCH] x11vnc: update to 0.9.16
In-Reply-To: <20190107113227.31452-1-martink@posteo.de> (Martin Kepplinger's
 message of "Mon, 7 Jan 2019 12:32:27 +0100")
References: <20190107113227.31452-1-martink@posteo.de>
Message-ID: <87lg3vdvyk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Kepplinger <martink@posteo.de> writes:

 > Update x11vnc from 0.9.15 to 0.9.16. For the changes, see
 > https://github.com/LibVNC/x11vnc/compare/0.9.15...0.9.16

 > Signed-off-by: Martin Kepplinger <martink@posteo.de>

Committed, thanks.

Apparently 0.9.15 did not contain a COPYING file (so x11vnc-legal-info
was broken).

I have also added a hash for the COPYING file.

-- 
Bye, Peter Korsgaard
