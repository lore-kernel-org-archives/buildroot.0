From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Sep 2019 18:44:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/postgresql: security bump
 version to 11.5
In-Reply-To: <20190902135210.bghafilftgv44hzx@sapphire.tkos.co.il> (Baruch
 Siach's message of "Mon, 2 Sep 2019 16:52:10 +0300")
References: <20190809155941.26206-1-bernd.kuhls@t-online.de>
 <87y2z7ymo2.fsf@dell.be.48ers.dk>
 <20190902135210.bghafilftgv44hzx@sapphire.tkos.co.il>
Message-ID: <87ftley7fz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Mon, Sep 02, 2019 at 01:15:09PM +0200, Peter Korsgaard wrote:
 >> >>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
 >> 
 >> > Release notes: https://www.postgresql.org/about/news/1960/
 >> > Switch POSTGRESQL_SITE to https.
 >> 
 >> > Fixes CVE-2019-10208, CVE-2019-10209, CVE-2019-10210 & CVE-2019-10211.
 >> 
 >> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> 
 >> Committed to 2019.02.x and 2019.05.x, thanks.

 > Not in 2019.05.x as of 5d77d83bd3db.

Sorry, I didn't push right away as I was considering if the wpewebkit
patches were worthwhile to backport for 2019.05.x.

I've pushed now.

-- 
Bye, Peter Korsgaard
