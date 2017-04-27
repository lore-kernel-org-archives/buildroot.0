From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Apr 2017 10:18:45 +0200
Subject: [Buildroot] [PATCH] libmpeg2: fix sparc32 build
In-Reply-To: <20170427053609.GA20301@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Thu, 27 Apr 2017 07:36:09 +0200")
References: <20170427053609.GA20301@waldemar-brodkorb.de>
Message-ID: <87wpa6l0uy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > The output detection recognized wrong target output, because
 > sparcv9 optimization flags used for sparcv8 build.

 > Fixes:
 >   http://autobuild.buildroot.net/results/1b3158b03f7eaf5afb5a4dab9526091888f6c9b8

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks. Don't forget to submit it upstream as well.

-- 
Bye, Peter Korsgaard
