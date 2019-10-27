From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2019 10:04:41 +0100
Subject: [Buildroot] [PATCH 4/5] docs/manual: bump our gcc/g++
 requirements to 4.8
In-Reply-To: <47d6a13296c923dda525430677776d0c278f0a1f.1572101547.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 26 Oct 2019 16:53:23 +0200")
References: <cover.1572101547.git.yann.morin.1998@free.fr>
 <47d6a13296c923dda525430677776d0c278f0a1f.1572101547.git.yann.morin.1998@free.fr>
Message-ID: <87sgnek192.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, we only require a gcc 4.4 version, which nowis pretty old
 > (released in April 2009). This requirement is not even tested nowadays,
 > with our oldest autobuilder having a 4.7 version only.

 > And even then, 4.7 is still old enough that it prevents us from
 > upgrading some packages. For example cmake 3.10+ requires C++11
 > constructs that were only added in gcc 4.8 (when C++11 support was
 > finally completed in gcc).

 > So, update our requirements to gcc at least 4.8.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
