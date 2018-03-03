From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Mar 2018 17:18:26 +0100
Subject: [Buildroot] [PATCH 1/2] support/scripts/check-uniq-files: add
 indices in format string
In-Reply-To: <20180303143620.16859-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 3 Mar 2018 15:36:19 +0100")
References: <20180303143620.16859-1-thomas.petazzoni@bootlin.com>
Message-ID: <87r2p1b0a5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Using {} in format strings is only supported in sufficiently recent
 > Python versions. Python 2.6 doesn't support this, and only format
 > strings with numbered arguments: {0}, {1}, etc.

 > Python 2.7:

 > $ python -c 'print("foo {}".format(12))'
 > foo 12
 > $ python -c 'print("foo {0}".format(12))'
 > foo 12

 > Python 2.6:

 > $ python -c 'print("foo {}".format(12))'
 > Traceback (most recent call last):
 >   File "<string>", line 1, in <module>
 > ValueError: zero length field name in format
 > $ python -c 'print("foo {0}".format(12))'
 > foo 12

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
