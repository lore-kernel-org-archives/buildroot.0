From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Oct 2013 17:20:52 +0200
Subject: [Buildroot] [PATCH] Fix compilation of busybox 1.21.1
In-Reply-To: <20131008152626.7217c920@skate> (Thomas Petazzoni's message of
 "Tue, 8 Oct 2013 15:26:26 +0200")
References: <1381238186-24937-1-git-send-email-jezz@sysmic.org>
 <20131008152626.7217c920@skate>
Message-ID: <878uy37prf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear J?r?me Pouiller,
 Thomas> On Tue,  8 Oct 2013 15:16:26 +0200, J?r?me Pouiller wrote:
 >> It seems patches previously applied on busybox 1.20.2 are also needed
 >> for version 1.21.1.
 >> 
 >> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
 >> ---  
 >> .../busybox/1.21.1/busybox-1.21.1-kernel_ver.patch |   25 ++++
 >> package/busybox/1.21.1/busybox-1.21.1-ntpd.patch   |   11 ++

 Thomas> Those two patches lack the description + Signed-off-by.

 Thomas> The first patch is 556ac3633ce3e7bd51c93b78827ae3874d856257 upstream,
 Thomas> and the second patch is b7841cf7b919b16d1bd4619154bf7cb4c22b4ccd.

But:

git describe --contains 556ac3633ce3e7bd51c93b78827ae3874d856257
1_21_0~181

git describe --contains b7841cf7b919b16d1bd4619154bf7cb4c22b4ccd
1_21_0~27

E.G. both are in 1.21.x?

-- 
Bye, Peter Korsgaard
