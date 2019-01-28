From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 09:59:40 +0100
Subject: [Buildroot] [PATCH 1/1] zbar: needs kernel headers >= 3.17
In-Reply-To: <20190119093710.1337-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 19 Jan 2019 10:37:10 +0100")
References: <20190119093710.1337-1-fontaine.fabrice@gmail.com>
Message-ID: <87lg35f98j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > v4l2_query_ext_ctrl has been added in kernel 3.17:
 > https://github.com/torvalds/linux/commit/5082c2417841e64df975789011e182ce99a9dacd

 > Fixes:
 >  - http://autobuild.buildroot.org/results/d7b244cf9488eafb59ba8575f17884f4f8512db1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
