From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Jul 2020 08:23:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/mraa: fix architecture
In-Reply-To: <20200724203103.990071-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 24 Jul 2020 22:31:03 +0200")
References: <20200724203103.990071-1-fontaine.fabrice@gmail.com>
Message-ID: <877dus15a9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > mraa supports aarch64 since version 0.9.0 and
 > https://github.com/eclipse/mraa/commit/47ec54c3330de176ed0b8e3254e81d9451fb866a

 > mips is supported since version 1.9.0 and
 > https://github.com/eclipse/mraa/commit/6770be911ba18b25ff284eeac80390e4111f602f

 > Moreover, BUILD_ARCH must be passed otherwise build will fail on i686
 > and arm

 > Fixes:
 >  - http://autobuild.buildroot.org/results/8e99eb282668f6f83f43c5be45112d82936e3408
 >  - http://autobuild.buildroot.org/results/75ba0840da6eb4907847ef05adeec2df109c9937

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
