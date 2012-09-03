From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Mon, 03 Sep 2012 21:56:31 +0300
Subject: [Buildroot] Bash string manipulation in Kconfig
Message-ID: <5044FD5F.102@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone.

What is the equivalent buildroot thing for handling the following bash
string stuff ?

FULL_DOWNLOAD_URL="http://www.somedomain.com/blah/blah2/blahblahblah/somefile"
FILE=${FULL_DOWNLOAD_URL##*/}
echo ${FILE}

That will correctly print only the last part of the url, "somefile"

But how to do similar in buildroot  .mk files ???

Best regards
Stefan
