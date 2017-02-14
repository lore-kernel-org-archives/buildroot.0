From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Feb 2017 11:17:54 +0100
Subject: [Buildroot] [PATCH] bctoolbox: fix typos and logic error
In-Reply-To: <20170214090132.GA5012@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Tue, 14 Feb 2017 10:01:32 +0100")
References: <20170214090132.GA5012@waldemar-brodkorb.de>
Message-ID: <87bmu5kre5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > To get the directory path from the library name you need to
 > use a single filename. Fix typo in variable name.

 > This fixes the ortp autobuild errors which uses the broken pkgconfig file
 > from bctoolbox.

 > Fixes:
 >   http://autobuild.buildroot.net/results/37d5625df4be11ccdc063871e9f6e13d5f59fb52
 >   http://autobuild.buildroot.net/results/1999c841fae41f860f00747a362327cb2857e687

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks. Don't forget to send the patch upstream.

-- 
Bye, Peter Korsgaard
