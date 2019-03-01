From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 Mar 2019 19:54:04 +0100
Subject: [Buildroot] Python 2.7 end of life on January 1, 2020
Message-ID: <20190301195404.1c00356b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Through a LWN.net article, I recently realized that Python 2.7 will see
its end of life on January 1, 2020, according to:

  https://www.python.org/dev/peps/pep-0373/

You also have a fancy countdown at:

  https://pythonclock.org/

This means that our 2020.02 LTS release probably should not have Python
2.x anymore ?

If that's our decision, then we should probably discuss the deprecation
path we want to follow to strongly warn users that they should migrate
away from Python 2.x.

What do people think about this ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
