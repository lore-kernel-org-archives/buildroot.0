From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 May 2018 22:48:10 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-05-02
In-Reply-To: <20180503060016.3C37E207B3@mail.bootlin.com> (Thomas Petazzoni's
 message of "Thu, 3 May 2018 08:00:16 +0200 (CEST)")
References: <20180503060016.3C37E207B3@mail.bootlin.com>
Message-ID: <87h8nocvp1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > Build statistics for 2018-05-02
 > ===============================

 >       branch |  OK | NOK | TIM | TOT |
 >    2018.02.x |  24 |   1 |   0 |  25 |
 >       master | 137 |  55 |   0 | 192 |

 > Results for branch '2018.02.x'
 > ==============================

 > Classification of failures by reason
 > ------------------------------------

 >         wireguard-0.0.20180420 | 1 


 > Detail of failures
 > ------------------

 >      powerpc |         wireguard-0.0.20180420 | NOK | http://autobuild.buildroot.net/results/b21be50fa6114786267e9057a388361f91dd1ea4 | ORPH

Download issue. The mirroring script was not running on the 2018.02.x
branch. Fixed now.

-- 
Bye, Peter Korsgaard
