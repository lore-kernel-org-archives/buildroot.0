From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Oct 2013 09:02:11 -0300
Subject: [Buildroot] Ncurses wide support
In-Reply-To: <20131015135906.10b43a4a@skate>
References: <CAAEAJfCkpC6-ZnpcxYCgTiZN8=QJNY+wZg83Jjyzs8-e7jPkkw@mail.gmail.com>	<525D1693.3010509@zacarias.com.ar>	<CAAEAJfD_YaKXY5cMn9H7DcUe3fyJ8L7wJ+RkmaOy40D0KmSZtw@mail.gmail.com>	<20131015133626.180de72d@skate>	<525D2D6E.9000108@zacarias.com.ar>
 <20131015135906.10b43a4a@skate>
Message-ID: <525D2EC3.5010600@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/15/2013 08:59 AM, Thomas Petazzoni wrote:

> ncurses is crap :)
> 
> A possible solution would be to have a package/ncursesw/ in Buildroot,
> that does the same thing as package/ncurses/, but builds the ncursesw
> library. This way, packages who want one or the other variant of the
> library can have proper dependencies.

But that would require auditing which packages want/benefit from the
wide version and add some workarounds about that.
Regards.
