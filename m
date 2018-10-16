From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Oct 2018 14:46:19 +0200
Subject: [Buildroot] [PATCH] squid: requires C++11 toolchain
In-Reply-To: <7de2a66d889a8723f41e397005c1c46a15470974.1539689856.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 16 Oct 2018 14:37:36 +0300")
References: <7de2a66d889a8723f41e397005c1c46a15470974.1539689856.git.baruch@tkos.co.il>
Message-ID: <8736t612lg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The squid changelog for version 4.0.1 mentions that "C++11 compiler
 > support is now mandatory". The code uses the std::map::emplace method
 > that gcc before 4.8 does not support.

 > Also fixes:
 > http://autobuild.buildroot.net/results/370/37093f8d3395850b2db5ed645f60d1c2df92768d/
 > http://autobuild.buildroot.net/results/921/92117726e7b4ede08dcc0e4fd1a85171fd17aeb8/
 > http://autobuild.buildroot.net/results/e67/e679ef90219c5e8f9c94ddcd7d3f9582f79ef751/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
