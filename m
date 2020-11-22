From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2020 15:24:32 +0100
Subject: [Buildroot] [PATCH] support/dependencies: clarify intended use
 of host bison/flex
In-Reply-To: <81a71f6a0a11476b60bc81f70d8f0ad9387dfa78.1605848921.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 20 Nov 2020 07:08:41 +0200")
References: <81a71f6a0a11476b60bc81f70d8f0ad9387dfa78.1605848921.git.baruch@tkos.co.il>
Message-ID: <87zh39wjtr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > We should not rely on host installed bison/flex for target code. This
 > ensures better reproducibility of generated code.

 > http://lists.busybox.net/pipermail/buildroot/2020-November/296786.html

 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
