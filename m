From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 14 Oct 2013 08:44:08 +0200
Subject: [Buildroot] How to find a package
In-Reply-To: <20131014041547.GA3683@tarshish>
References: <1381723658.10819.YahooMailNeo@web160804.mail.bf1.yahoo.com>
 <20131014041547.GA3683@tarshish>
Message-ID: <CAAXf6LWu9bNKACVdk0j6PVvBDiM59y-kiOH33fFkO=EnF4hOHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Tal,


On Mon, Oct 14, 2013 at 6:15 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Tal,
>
> On Sun, Oct 13, 2013 at 09:07:38PM -0700, Tal Lubko wrote:
>> I'm new to buildroot and I would like to know what's the easiest way to
>> search for a package in buildroot menus?
>
> I usually do just 'ls package/'. If this doesn't give the desired result (some
> packages are nested in subdirectories) I use 'git grep'.

Here are some other ways to find a package:
- the manual contains a list of all packages:
http://buildroot.uclibc.org/downloads/manual/manual.html#package-list
- in the menuconfig, you can search by typing a slash (/) followed by
your query. It will show you for each match the location in the menu
structure, and any dependencies it may have.

Best regards,
Thomas
