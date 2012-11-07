From: =?ISO-8859-1?Q?J=FCrgen?= Benjamin Ronshausen <b.r@rie.eu>
Date: Wed, 07 Nov 2012 14:54:16 +0100
Subject: [Buildroot] how does udhcpc print messages to console
Message-ID: <1352296456.3710.10.camel@debian.fritz.box>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

solution found

fflush(stdout);
