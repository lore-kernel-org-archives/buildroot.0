From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 08:55:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/rhash: fix build failure due to
 gcc -v
In-Reply-To: <20201225223441.GH1680670@scaer> (Yann E. MORIN's message of
 "Fri, 25 Dec 2020 23:34:41 +0100")
References: <20201203202853.616174-1-fontaine.fabrice@gmail.com>
 <20201225223441.GH1680670@scaer>
Message-ID: <87o8ifd6ns.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Fabrice, All,
 > On 2020-12-03 21:28 +0100, Fabrice Fontaine spake thusly:
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/8605c16cc28316954ce8b9dcc266974390c5da20
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > Applied to master with the following changes:

 >   - retain "$CC -v" as default, fallback to "$CC --version", in the hope
 >     that it stands better chance with upstream
 >   - write a commit log to explain the actual root-cause of the build
 >     failure

This is only an issue with rhash 1.4.0, and not the older versions we
have on the stable branches, right?

-- 
Bye, Peter Korsgaard
