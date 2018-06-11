From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 21:35:59 +0200
Subject: [Buildroot] [PATCH 1/1] yaml-cpp: disable tests
In-Reply-To: <20180611045144.18669-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 11 Jun 2018 06:51:44 +0200")
References: <20180611045144.18669-1-fontaine.fabrice@gmail.com>
Message-ID: <87bmchdskg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > fork is used in tests so build fails without MMU
 > Fixes:
 > - http://autobuild.buildroot.net/results/3cb7c4d93e466c6eef69aacd0e561a9fb569e69b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
