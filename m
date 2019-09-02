From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 02 Sep 2019 21:00:09 +0300
Subject: [Buildroot] [PATCH 1/1] package/postgresql: security bump
 version to 11.5
In-Reply-To: <87ftley7fz.fsf@dell.be.48ers.dk>
References: <20190809155941.26206-1-bernd.kuhls@t-online.de>
 <87y2z7ymo2.fsf@dell.be.48ers.dk>
 <20190902135210.bghafilftgv44hzx@sapphire.tkos.co.il>
 <87ftley7fz.fsf@dell.be.48ers.dk>
Message-ID: <87d0gia89i.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, Sep 02 2019, Peter Korsgaard wrote:
>>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
>  > On Mon, Sep 02, 2019 at 01:15:09PM +0200, Peter Korsgaard wrote:
>  >> >>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
>  >>
>  >> > Release notes: https://www.postgresql.org/about/news/1960/
>  >> > Switch POSTGRESQL_SITE to https.
>  >>
>  >> > Fixes CVE-2019-10208, CVE-2019-10209, CVE-2019-10210 & CVE-2019-10211.
>  >>
>  >> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>  >>
>  >> Committed to 2019.02.x and 2019.05.x, thanks.
>
>  > Not in 2019.05.x as of 5d77d83bd3db.
>
> Sorry, I didn't push right away as I was considering if the wpewebkit
> patches were worthwhile to backport for 2019.05.x.
>
> I've pushed now.

But this postgresql bump is still not in 2019.05.x, which is now at
a236e8fb3647.

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
