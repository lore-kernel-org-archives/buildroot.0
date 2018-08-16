From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 11:43:46 +0200
Subject: [Buildroot] host-libselinux atomics with GCC 4.4
In-Reply-To: <4e9928a9-5a67-fdc7-63a9-bd34118f3dee@mentor.com>
References: <20180812060015.A385B207E5@mail.bootlin.com>
 <20180812223629.2bac8ebe@windsurf>
 <CANQCQpbDmecDS1LE8HY46y1BnEtJH=cRsmo7KEbZhsNZvHhquw@mail.gmail.com>
 <CANQCQpZ2mVuPkeeiR5yxKf3Cs7xUiADuO0dAMkZxsLaCa_iQCw@mail.gmail.com>
 <95ce06f3-5560-81f3-4949-0a2842b7b78a@mentor.com>
 <CANQCQpZ2dPYy9kwS1tZ9LYXxwJZjEO66vmOSSZU17NO=7a+AQw@mail.gmail.com>
 <4e9928a9-5a67-fdc7-63a9-bd34118f3dee@mentor.com>
Message-ID: <20180816114346.4196c730@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Aug 2018 12:43:10 -0700, Hollis Blanchard wrote:

> >> Due to the surprisingly quick response from the maintainers, it looks
> >> like we already have an answer: the patch is OK, so we don't need the
> >> Kconfig changes. (A more aggressive patch is almost certainly OK too,
> >> but I doubt anybody wants to fuss about it.)  
> > Did you want to tie-off with upstream and then submit the patch here?  
> "Want to": no, but I submitted the patch anyways. ;-)

I took your libselinux patch, added it in package/libselinux/, and
applied:

  https://git.buildroot.org/buildroot/commit/?id=6288409642d8368104f916bd264d2cb042942dfa

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
