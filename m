From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 8 Jan 2018 07:49:16 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-01-06
In-Reply-To: <CAMRc=MeF+VTsFC-O8M3wdbwLf-No5NALimddaVyN3=w=M2TR7w@mail.gmail.com>
References: <20180107070006.3886D207B4@mail.free-electrons.com>
 <CAMRc=MeF+VTsFC-O8M3wdbwLf-No5NALimddaVyN3=w=M2TR7w@mail.gmail.com>
Message-ID: <20180108054916.wtom7vmn52cpzsj7@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bartosz,

On Mon, Jan 08, 2018 at 01:55:54AM +0100, Bartosz Golaszewski wrote:
> 2018-01-07 8:00 GMT+01:00 Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>:
> > Hello,
> >
> > Build statistics for 2018-01-06
> > ===============================
> >
> >       branch |  OK | NOK | TIM | TOT |
> >       master | 189 |  42 |   4 | 235 |
> >    2017.11.x |  24 |   0 |   0 |  24 |
> >
> > Results for branch 'master'
> > ===========================
> >
> > Classification of failures by reason
> > ------------------------------------
> >
> >              libzip-legal-info | 16
> 
> I believe this has something to do with the recent bump to 1.4.0 you
> submitted. Could you take a look? I'm travelling this week and don't
> have the bandwidth.

The fix that Matt Weber posted while I was offline on Saturday has already 
been applied:

https://git.busybox.net/buildroot/commit/?id=13f554f530b371137eb39dd07b07ebefad1d5a73

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
