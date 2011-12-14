From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 14 Dec 2011 08:41:41 +0100
Subject: [Buildroot] [RFC] Python packages
Message-ID: <4EE85335.9060109@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I just wanted to add some network related python packages (dpkt and netifaces) to buildroot. At the moment we have only pyserial as external python component, residing in packages/python-serial. Should I pack these packages just under Libraries->Networking or should I create special folder packages/python-addons and put those packages there?

Best regards,
Yegor
