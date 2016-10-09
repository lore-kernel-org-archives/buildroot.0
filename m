From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 20:45:09 +0200
Subject: [Buildroot] gc20 no space left issue
Message-ID: <20161009204509.49fc7a4b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Due to a lack of disk space, gcc20 reports some build failures, such as:

  http://autobuild.buildroot.net/results/6a2/6a2d4cb453128c0aa1fc9ed0ac04ec7c8306e7e1/

Could you see if you can fix this ?

Perhaps we should start thinking about a way of ignoring the build
results caused by a lack of disk space ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
