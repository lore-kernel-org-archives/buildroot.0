From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 24 Jul 2013 08:24:59 +0200
Subject: [Buildroot] netcat package?
In-Reply-To: <20130724033444.GI5509@tarshish>
References: <20130724032345.GB13697@zuhnb712.ap.bm.net>
 <20130724033444.GI5509@tarshish>
Message-ID: <CAAXf6LXm+XQ28noApGXJiBPRDddXUU+jaLDVyxWGnbMW1qeQmw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Jul 24, 2013 at 5:34 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Woody Wu,
>
> On Wed, Jul 24, 2013 at 11:23:45AM +0800, Woody Wu wrote:
>> Is there a netcat package in buildroot?  I did not find it on the menu,
>> but just think buildroot should already have this famous tool.
>
> You should find the netcat package under "Networking applications". Make sure
> to select "Show packages that are also provided by busybox", otherwise the
> netcat package is not shown in the menu.
>

General tip: in menuconfig systems, you can search for a string by
typing the / character.
In the result overview, you see the found symbols, and also the
location in the menu structure. If there are any dependencies or
automatic selections, these are shown in boolean syntax as well. This
is precisely the information needed to deduce what Baruch wrote above.

Best regards,
Thomas
