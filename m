From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Jun 2020 14:27:09 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-06-03
In-Reply-To: <CANQCQpZuL2Rbbw87JhCLv2D+dxpQ2R5PWkHs7SHLyaeOH0PgAQ@mail.gmail.com>
 (Matthew Weber's message of "Thu, 4 Jun 2020 06:44:52 -0500")
References: <20200604062805.96615887A1@hemlock.osuosl.org>
 <CANQCQpZuL2Rbbw87JhCLv2D+dxpQ2R5PWkHs7SHLyaeOH0PgAQ@mail.gmail.com>
Message-ID: <87pnafauea.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

Hi,

 >> Results for branch '2020.02.x'
 >> ==============================
 >> 
 >> Classification of failures by reason
 >> ------------------------------------
 >> 
 >> host-checkpolicy-2.9 | 1
 >> mongodb-r4.0.12 | 1
 >> 
 >> 
 >> Detail of failures
 >> ------------------
 >> 
 >> arch     |             reason             | OK? |                                       url                                       | orph?
 >> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 >> mips64el   |      host-checkpolicy-2.9      | NOK | http://autobuild.buildroot.net/results/7c0666b53e2b41d794eefb7d0970e4e1fb71dc7c |

 > Needs  50de52ae693b4d22e1275d98382de7b66baa0d78   cherry-picked in

Thanks, I'll take care of it.

-- 
Bye, Peter Korsgaard
