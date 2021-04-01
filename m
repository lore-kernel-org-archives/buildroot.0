From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Apr 2021 15:36:21 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-03-31
In-Reply-To: <CAEyMn7ZVFpc2oUnYi+_ytcnvNOpT69ZYyK=c6+zR7rVDec9qcQ@mail.gmail.com>
 (Heiko Thiery's message of "Thu, 1 Apr 2021 11:57:19 +0200")
References: <20210401092300.6174540F73@smtp4.osuosl.org>
 <CAEyMn7ZVFpc2oUnYi+_ytcnvNOpT69ZYyK=c6+zR7rVDec9qcQ@mail.gmail.com>
Message-ID: <87eefuazze.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:

 > Hi all,
 > Am Do., 1. Apr. 2021 um 11:23 Uhr schrieb Thomas Petazzoni
 > <thomas.petazzoni@bootlin.com>:
 >> 
 >> Hello,
 >> 
 >> Autobuild statistics for 2021-03-31
 >> ===================================
 >> 
 >> branch |  OK | NOK | TIM | TOT |
 >> 2020.02.x  | 10  |  3  |  0  | 13  |
 >> 2020.11.x  | 11  |  1  |  0  | 12  |
 >> 2021.02.x  | 23  |  6  |  0  | 29  |
 >> master   | 107 | 32  |  0  | 139 |
 >> 

 > [..]

 >> Classification of failures by reason for 2020.02.x
 >> --------------------------------------------------
 >> 
 >> augeas-1.12.0 | 1
 >> libnetconf2-1.1.3 | 1
 >> wireshark-3.2.10 | 1

 > Do we still care about autobuild failures in the old LTS branch
 > 2020.02.x? Or can I ignore that one for the package I'm listed as
 > maintainer?

We normally do one more point release of the previous LTS approximately
1 month after releasing a new LTS, so I will release it very soon. If you
have easy fixes for these issues then please send them, but it will
indeed very soon become EOL.

-- 
Bye, Peter Korsgaard
