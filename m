From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 29 Apr 2014 23:08:53 +0200
Subject: [Buildroot] [PATCH] imlib2: uses dlopen(),
	not available in static cases
In-Reply-To: <1398798016-14915-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 29 Apr 2014 21:00:16 +0200")
References: <1398798016-14915-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871twfvo62.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > According to the imlib2 people, if you don't support dlopen(), you
 > have a "crap box":

 > image.h:16:4: warning: #warning "your crap box doesn't define RTLD_LOCAL !?"

 > So, let's disable imlib2 when doing static linking.

 > Fixes:

 >   http://autobuild.buildroot.net/results/b5e/b5ee859409cd626b769e8a159026e60ec6f29180/

Committed with the missing 'a' added, thanks.

-- 
Bye, Peter Korsgaard
