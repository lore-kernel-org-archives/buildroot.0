From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Jan 2014 21:09:22 +0100
Subject: [Buildroot] [PATCH v3] ca-certificates: new package
In-Reply-To: <1389368384-1332-1-git-send-email-martin@barkynet.com> (Martin
 Bark's message of "Fri, 10 Jan 2014 15:39:44 +0000")
References: <1389368384-1332-1-git-send-email-martin@barkynet.com>
Message-ID: <87y52l2c99.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:

 > CA certificates used for SSL based applications.  The package installs CA
 > certificates to /usr/share/ca-certificates and creates symbolic links under
 > /etc/ssl/certs.  For example, the existing libcurl package will use these
 > certificates for https urls.  Based on the debian ca-certifcates package.

 > Signed-off-by: Martin Bark <martin@barkynet.com>

Committed with Yann's comment taken into account, thanks.

-- 
Bye, Peter Korsgaard
