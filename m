From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 17:20:00 +0100
Subject: [Buildroot] [PATCH 2/2] package/madplay: fix static build
In-Reply-To: <20190215224207.15546-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 15 Feb 2019 23:42:07 +0100")
References: <20190215224207.15546-1-fontaine.fabrice@gmail.com>
 <20190215224207.15546-2-fontaine.fabrice@gmail.com>
Message-ID: <87h8cxqfkf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add a patch to use pkg-config to find id3tag dependency (-lz)
 > Fixes:
 >  - http://autobuild.buildroot.org/results/5e4882ddacf205a92a3ff1e79649cf16e4b6c0ae

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
