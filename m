From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Nov 2020 08:33:40 +0100
Subject: [Buildroot] [PATCH 2/2] package/collectd: fix grpc dependency
In-Reply-To: <20201104063637.3349-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 4 Nov 2020 07:36:37 +0100")
References: <20201104063637.3349-1-fontaine.fabrice@gmail.com>
 <20201104063637.3349-2-fontaine.fabrice@gmail.com>
Message-ID: <877dr14luz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit e98610f039b88a5d164b19343d5ecef2d1c01f6d forgot to propagate
 > libabseil-cpp dependencies to BR2_PACKAGE_COLLECTD_GRPC

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c9bacfb52ae46ab78a5f9097a8df83e10d23ccc4

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
