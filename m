From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Apr 2019 09:29:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/bind: fix python build
In-Reply-To: <20190427134925.1730-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 27 Apr 2019 15:49:25 +0200")
References: <20190427134925.1730-1-fontaine.fabrice@gmail.com>
Message-ID: <87ef5ls20j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > A check for python-ply has been added as this is a dependency of the
 > dnssec-keymgr script so install host-python-ply to avoid a build failure
 > if python-ply is not installed on host

 > Fixes:
 >  - http://autobuild.buildroot.org/results/96815b1300547c976443bf74b762febdfcc8d3ba

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
