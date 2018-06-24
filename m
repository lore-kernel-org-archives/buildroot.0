From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Jun 2018 14:47:07 +0200
Subject: [Buildroot] [PATCH 1/1] host-protobuf-c: fix build with gcc 4.8
In-Reply-To: <20180624085219.10452-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 24 Jun 2018 10:52:19 +0200")
References: <20180624085219.10452-1-fontaine.fabrice@gmail.com>
Message-ID: <87tvpsfj1w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > protobuf requires C++11 so add -std=c++11 for host-protobuf-c as it is
 > experimental in gcc 4.8

 > Fixes:
 >  - http://autobuild.buildroot.net/results/7fe12457ccac7e8c95b1d4c1fa20d6753599742d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
