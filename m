From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 14 Oct 2013 07:15:47 +0300
Subject: [Buildroot] How to find a package
In-Reply-To: <1381723658.10819.YahooMailNeo@web160804.mail.bf1.yahoo.com>
References: <1381723658.10819.YahooMailNeo@web160804.mail.bf1.yahoo.com>
Message-ID: <20131014041547.GA3683@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tal,

On Sun, Oct 13, 2013 at 09:07:38PM -0700, Tal Lubko wrote:
> I'm new to buildroot and I would like to know what's the easiest way to 
> search for a package in buildroot menus?

I usually do just 'ls package/'. If this doesn't give the desired result (some 
packages are nested in subdirectories) I use 'git grep'.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
