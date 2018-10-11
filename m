From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Oct 2018 20:33:24 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-10-08
In-Reply-To: <875zybmyvn.fsf@tkos.co.il> (Baruch Siach's message of "Tue, 09
 Oct 2018 09:13:00 +0300")
References: <20181009060047.754D6207C3@mail.bootlin.com>
 <875zybmyvn.fsf@tkos.co.il>
Message-ID: <87a7nk1ggb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > Thomas Petazzoni writes:
 >> Results for branch '2018.02.x'
 >> ==============================
 >> 
 >> Classification of failures by reason
 >> ------------------------------------
 >> 
 >> libcurl-7.61.1 | 1 
 >> 
 >> 
 >> Detail of failures
 >> ------------------
 >> 
 >> arm |                 libcurl-7.61.1 | NOK | http://autobuild.buildroot.net/results/f98ad90a77295d73c3ef2fc704f5ec187a31832e |     

 > Commit e7d658e029 (libcurl: add brotli optional dependency) should fix
 > this build issue in 2018.02.x.

Ahh, thanks for the heads up - Will cherry-pick it.

-- 
Bye, Peter Korsgaard
