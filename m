From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 10:43:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcamera: fix build on sparc v8
In-Reply-To: <20210527200354.478341-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 27 May 2021 22:03:54 +0200")
References: <20210527200354.478341-1-fontaine.fabrice@gmail.com>
Message-ID: <87czsukt2w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix build failure with sparc v8 which is raised since commit
 > bd9b7b092cf34dc065a4b40268c18a9fe319f5e4 due to
 > https://git.linuxtv.org/libcamera.git/commit/?id=a8310248fc26cc1e1b791af5e9394c1d20bee269

 > Fixes:
 >  - http://autobuild.buildroot.org/results/d0726b2253f1f3d006e057f3b32c646c4b9b5f7a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
