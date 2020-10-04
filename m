From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2020 21:04:01 +0200
Subject: [Buildroot] [PATCH v2] ruby: update to 2.7.1
In-Reply-To: <20201001004602.pfh6b7jfoj7v4eji@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Thu, 1 Oct 2020 02:46:02 +0200")
References: <20201001004602.pfh6b7jfoj7v4eji@waldemar-brodkorb.de>
Message-ID: <877ds5rexq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > - add patch to recognize coroutines correctly
 > - remove unneeded verconf.h remove hack

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 > v1-> v2:
 >  - fix build for SuperH/uClibc
 >  - remove unneeded verconf.h hack

You also forgot to update the license hashes. Please always remember to
run 'make ruby-legal-info' when bumping the version to verify.

-- 
Bye, Peter Korsgaard
