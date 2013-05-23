From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 May 2013 18:38:13 +0200
Subject: [Buildroot] [PATCH v2] mongrel2: Needs a {e,
 }glibc or a uClibc-0.9.34-git based toolchain
In-Reply-To: <1369326481-18848-1-git-send-email-markos.chandras@gmail.com>
References: <1369326481-18848-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <20130523183813.289449aa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Thu, 23 May 2013 17:28:01 +0100, Markos Chandras wrote:
> From: Markos Chandras <markos.chandras@imgtec.com>
> 
> mongrel2 needs the {get,make,swap}context functions which are
> present in {e,}glibc and in the uClibc's master branch.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8e132a2b03a7b5ae94199db7db86883c05dca700/build-end.log
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
