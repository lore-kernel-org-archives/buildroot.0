From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Mar 2018 16:51:35 +0100
Subject: [Buildroot] [PATCH v2 2/9] dumb-init: new package
In-Reply-To: <20180301100227.3fb09c06@windsurf.lan> (Thomas Petazzoni's
 message of "Thu, 1 Mar 2018 10:02:27 +0100")
References: <20180301072012.25884-1-christian@paral.in>
 <20180301072012.25884-3-christian@paral.in>
 <20180301100227.3fb09c06@windsurf.lan>
Message-ID: <87lgfbiyk8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Thu,  1 Mar 2018 02:20:05 -0500, Christian Stewart wrote:

 > However, using -static has a problem: what happens when you're doing a
 > BR2_SHARED_LIBS=y configuration, i.e when there is only support for
 > shared libraries, and not static libraries ? And BR2_SHARED_LIBS=y is
 > our default.

dumb-init doesn't depend on any libraries, so the only issue is static
linking with glibc, right?

-- 
Bye, Peter Korsgaard
