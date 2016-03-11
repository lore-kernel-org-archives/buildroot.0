From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Mar 2016 12:08:13 +0100
Subject: [Buildroot] Autobuilder update
In-Reply-To: <20160310234742.3df6dff2@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 10 Mar 2016 23:47:42 +0100")
References: <20160310234742.3df6dff2@free-electrons.com>
Message-ID: <8760wtjmqq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > Some autobuilder updates:

 >  - All the Buildroot pre-built external toolchains have been rebuilt
 >    with Buildroot 2016.02 + a few patches. To see which patches I'm
 >    using to build those external toolchains, see the branch at:

 >    http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=br-ext-toolchain-fixes

I recently also ran into these gmp/mpc/mpfr issues building a toolchain
at work (for the glibc dns issue) and had to spend some time to debug
and come up with a similar workaround as you did. I really think we
should include that patch in buildroot until we get the $ORIGIN rpath
stuff merged to save peoples time.

-- 
Bye, Peter Korsgaard
