From: Nicola Salvemini <nicolasalvemini@yahoo.it>
Date: Wed, 27 Feb 2008 15:32:21 +0000 (GMT)
Subject: [Buildroot] Problem with iperf
Message-ID: <220361.72868.qm@web23403.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have a ARM arm926t (it's a little-endian) target platform and I use buildroot to cross-compile applications.
I include iperf in the package selection for the target and the build phase go to the end without problems, but when I try to use iperf on the target, I take an exception:

NWFPE: iperf[770] takes exception 00000002 at c00288f0 from 400f4580
NWFPE: iperf[770] takes exception 00000002 at c00288f0 from 400f4580
NWFPE: iperf[770] takes exception 00000002 at c00288f0 from 400f4580

Could you please give me an idea to resolve the problem? 
Thanks in advance,

Nicola.




      ___________________________________ 
L'email della prossima generazione? Puoi averla con la nuova Yahoo! Mail: http://it.docs.yahoo.com/nowyoucan.html
