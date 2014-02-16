From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 16 Feb 2014 09:18:07 +0100
Subject: [Buildroot] [PATCH 2/2] opencv: always enable opencv_core
	module when opencv is enabled
In-Reply-To: <1392502403-19701-3-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sat, 15 Feb 2014 23:13:23 +0100")
References: <1392502403-19701-1-git-send-email-s.martin49@gmail.com>
 <1392502403-19701-3-git-send-email-s.martin49@gmail.com>
Message-ID: <87vbwfii80.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > It does not make much sense enabling opencv without its core module.
 > This configuration leads to build nothing (since all modules depend on
 > the core one), but install the configuration files (*.pc and *.cmake)
 > anyway.

 > This absurd situation may break the build-system of other packages
 > that would correctly find the *.pc (but does not check for the modules
 > they actually use), but would not build because of missing headers and
 > libraries.

 > Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
