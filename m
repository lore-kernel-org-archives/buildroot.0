From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 16:16:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/openssh: fix build with atomic
In-Reply-To: <20190425181437.25687-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 25 Apr 2019 20:14:37 +0200")
References: <20190425181437.25687-1-fontaine.fabrice@gmail.com>
Message-ID: <87ef5ox36n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Use pkg-config to retrieve openssl dependencies such as atomic
 > Fixes:
 >  - http://autobuild.buildroot.org/results/33d0e56368ab0e74d523be4837824654a4684746

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
