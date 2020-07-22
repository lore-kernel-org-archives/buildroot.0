From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 09:14:29 +0200
Subject: [Buildroot] [PATCH] package/bind: security bump to version
 9.11.20
In-Reply-To: <20200625070952.3005722-1-stefan.sorensen@spectralink.com>
 (stefan's message of "Thu, 25 Jun 2020 09:09:52 +0200")
References: <20200625070952.3005722-1-stefan.sorensen@spectralink.com>
Message-ID: <87d04oja22.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "stefan" == stefan  <stefan@astylos.dk> writes:

 > From: Stefan S?rensen <stefan.sorensen@spectralink.com>
 > Fixes the following security issue:
 >  * CVE-2020-8619: It was possible to trigger an INSIST failure when a
 >    zone with an interior wildcard label was queried in a certain
 >    pattern.

 > Release notes:
 > https://ftp.isc.org/isc/bind9/cur/9.11/RELEASE-NOTES-bind-9.11.20.txt

 > Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
