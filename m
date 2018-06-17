From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:00:26 +0200
Subject: [Buildroot] [git commit] package/binutils: default to 2.29 for
 Cortex-M targets
In-Reply-To: <20180601144051.27804836DA@busybox.osuosl.org> (Peter Korsgaard's
 message of "Fri, 1 Jun 2018 16:36:54 +0200")
References: <20180601144051.27804836DA@busybox.osuosl.org>
Message-ID: <87h8m1sbjp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=17f352acdebd4a825903807f8a2d60ebea223afb
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > binutils 2.29 changed the implementation of adr pseudo instruction
 > it breaks linux kernel and impacts Cortex-M targets (eg. stm32)

 > [Peter: simplify Config.in logic, adjust message to make it clear this is
 > 	just a default]
 > Signed-off-by: Laurent GONZALEZ <br22@gezedo.com>
 > Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, thanks (after fixing 2.29->2.28 in subject).

-- 
Bye, Peter Korsgaard
