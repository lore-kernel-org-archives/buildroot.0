From: Ryan Wilkins <ryan@deadfrog.net>
Date: Wed, 28 Aug 2013 19:22:47 -0400
Subject: [Buildroot] MesaLib
Message-ID: <A3285828-B3A0-4875-98F8-96A2BF7DD889@deadfrog.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm using buildroot 2013.08-rc2 and ran across an error on compile where MesaLib-7.10.3 can't be found.  Looking at the sources.buildroot.net server, 7.10.1 exists but not 7.10.3.  Output is below.

--2013-08-28 17:15:25--  http://sources.buildroot.net//MesaLib-7.10.3.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109  
Connecting to sources.buildroot.net (sources.buildroot.net)|176.9.16.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2013-08-28 17:15:25 ERROR 404: Not Found.


Should 7.10.3 be in the repository or is the buildroot source wrong?

Ryan Wilkins
