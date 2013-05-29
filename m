From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 May 2013 21:35:10 +0200
Subject: [Buildroot] Recurrent Blackfin build failure on icu
Message-ID: <20130529213510.43fc1372@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sonic,

On our autobuilders, a number of Blackfin builds end up failing with a
problem on the icu package, which otherwise seems to build fine on
other architectures.

See
http://autobuild.buildroot.org/results/0f9/0f953610792aa75f9bb1f9218bcac27b2786e3f8/build-end.log
for one occurrence of this problem. It would be nice if you could have
a look and figure out a way of solving this build problem.

Generally speaking, would you be interested in receiving a daily e-mail
that contains the list of build failures that occurred on the previous
day, and that are related to the Blackfin architecture? Supporting an
architecture in Buildroot also means to have this architecture in a
good shape in terms of autobuilders testing.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
