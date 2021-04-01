From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 1 Apr 2021 16:00:25 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-03-31
In-Reply-To: <87eefuazze.fsf@dell.be.48ers.dk>
References: <20210401092300.6174540F73@smtp4.osuosl.org>
 <CAEyMn7ZVFpc2oUnYi+_ytcnvNOpT69ZYyK=c6+zR7rVDec9qcQ@mail.gmail.com>
 <87eefuazze.fsf@dell.be.48ers.dk>
Message-ID: <CAEyMn7bdk0DfF0T_eN-jb=Kf61Hwdng6tmvHhjkDV2mioV7a4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter.

Am Do., 1. Apr. 2021 um 15:36 Uhr schrieb Peter Korsgaard <peter@korsgaard.com>:
>
> >>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:
>
>  > Hi all,
>  > Am Do., 1. Apr. 2021 um 11:23 Uhr schrieb Thomas Petazzoni
>  > <thomas.petazzoni@bootlin.com>:
>  >>
>  >> Hello,
>  >>
>  >> Autobuild statistics for 2021-03-31
>  >> ===================================
>  >>
>  >> branch |  OK | NOK | TIM | TOT |
>  >> 2020.02.x  | 10  |  3  |  0  | 13  |
>  >> 2020.11.x  | 11  |  1  |  0  | 12  |
>  >> 2021.02.x  | 23  |  6  |  0  | 29  |
>  >> master   | 107 | 32  |  0  | 139 |
>  >>
>
>  > [..]
>
>  >> Classification of failures by reason for 2020.02.x
>  >> --------------------------------------------------
>  >>
>  >> augeas-1.12.0 | 1
>  >> libnetconf2-1.1.3 | 1
>  >> wireshark-3.2.10 | 1
>
>  > Do we still care about autobuild failures in the old LTS branch
>  > 2020.02.x? Or can I ignore that one for the package I'm listed as
>  > maintainer?
>
> We normally do one more point release of the previous LTS approximately
> 1 month after releasing a new LTS, so I will release it very soon. If you
> have easy fixes for these issues then please send them, but it will
> indeed very soon become EOL.

I don't have a fix for the problem yet. I just wanted to make sure if
it was still worth the effort.

-- 
Heiko
