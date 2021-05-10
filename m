From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 May 2021 09:13:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/bullet: needs dynamic library
In-Reply-To: <20210506205048.2081535-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 6 May 2021 22:50:48 +0200")
References: <20210506205048.2081535-1-fontaine.fabrice@gmail.com>
Message-ID: <87mtt3t61n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build without dlfcn.h fails because bullet3 is not disabled since
 > commit 5f154799b6ed772a0c028072996e110fac131508

 > Fixes:
 >  - http://autobuild.buildroot.org/results/ab2efdd1eac64474adf00d8e60b42110c6e89143

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
