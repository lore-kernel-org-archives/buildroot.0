From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Feb 2021 17:59:13 +0100
Subject: [Buildroot] [PATCH 2/2] package/libbsd: needs dynamic library
In-Reply-To: <20210201175113.937333-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 1 Feb 2021 18:51:13 +0100")
References: <20210201175113.937333-1-fontaine.fabrice@gmail.com>
 <20210201175113.937333-2-fontaine.fabrice@gmail.com>
Message-ID: <875z37db1a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Static linking with libbsd fails because of multiple definition of the
 > strlcpy symbol. uClibc optionally provides these symbols.

 > So add a dependency on dynamic library to avoid a build failure with a
 > zeromq-enabled bitcoin or with stress-ng.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/ba87544d42ad5e77a27a7a504bc6336a06f6e291

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
