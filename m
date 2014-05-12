From: =?iso-8859-1?Q?Oscar_Hellstr=F6m?= <oscar.hellstrom@vinnter.se>
Date: Mon, 12 May 2014 14:16:32 +0000
Subject: [Buildroot] Enabling readline support in wpa_cli
In-Reply-To: <6ef3c8ef78fb45e3b64d042d0a681898@DB3PR04MB075.eurprd04.prod.outlook.com>
References: <6ef3c8ef78fb45e3b64d042d0a681898@DB3PR04MB075.eurprd04.prod.outlook.com>
Message-ID: <c0fce23a65a14e6cbd228a9ec03cf091@DB3PR04MB075.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I should probably have added the readline dependency as well, right?

/Oscar

From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of Oscar Hellstr?m
Sent: den 12 maj 2014 15:55
To: buildroot at busybox.net
Subject: [Buildroot] Enabling readline support in wpa_cli

Hi,

I wanted readline support in my wpa_cli, so I created the attached patch. This patch enables readline support if readline is selected separately. I'm not sure if this is the preferred way to do it, or if there should be an option, but it's how openssl is support is selected. The patch was created and tested in bouldroot-2013.08. I created a patch against git HEAD, but I haven't been able to test that one... I include both versions here if anyone's interested.

Kind regards
Oscar Hellstr?m

[cid:image003.jpg at 01CF1D9A.E7C218A0]
Oscar Hellstr?m
Embedded Product Developer

+46 734 41 81 12
oscar.hellstrom at vinnter.se<mailto:oscar.hellstrom@vinnter.se>
Lync: oshe at vinngroup.net<mailto:oshe@vinngroup.net>
LinkedIn<http://www.linkedin.com/in/oscarh>

Vinnter AB
Alfred Wigelius V?g 10
412 72 G?teborg, Sweden
www.vinnter.se<http://www.vinnter.se/>

[cid:image004.jpg at 01CF1D9A.E7C218A0]

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140512/c9825ea1/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image001.jpg
Type: image/jpeg
Size: 2083 bytes
Desc: image001.jpg
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140512/c9825ea1/attachment.jpg>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image002.jpg
Type: image/jpeg
Size: 1432 bytes
Desc: image002.jpg
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140512/c9825ea1/attachment-0001.jpg>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-2013.08-wpa_cli-readline.patch
Type: application/octet-stream
Size: 929 bytes
Desc: buildroot-2013.08-wpa_cli-readline.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140512/c9825ea1/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-2014-05-12-wpa_cli-readline.patch
Type: application/octet-stream
Size: 603 bytes
Desc: buildroot-2014-05-12-wpa_cli-readline.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140512/c9825ea1/attachment-0001.obj>
