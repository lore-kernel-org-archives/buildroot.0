From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Jan 2019 13:56:40 +0100
Subject: [Buildroot] Migration to OpenSSL 1.1.1?
In-Reply-To: <CANQCQpYePwq3HHJxOjE3F=EFzp0=-AfPUL+KX0gtXyOrHU5p4A@mail.gmail.com>
References: <OFCE363AB5.EB39827A-ONC1258383.0037AF48-C1258383.0038BD5C@local-dmz.de>
 <CANQCQpYePwq3HHJxOjE3F=EFzp0=-AfPUL+KX0gtXyOrHU5p4A@mail.gmail.com>
Message-ID: <20190115135640.762d0d4d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Peter in Cc.

On Tue, 15 Jan 2019 06:17:28 -0600, Matthew Weber wrote:

> On Tue, Jan 15, 2019 at 4:30 AM Marcel Patzlaff <M.Patzlaff@pilz.de> wrote:
> >
> > Hello,
> >
> > after reading https://www.openssl.org/source/ (especially the part where
> > the version support is stated), the following question pops up:
> > Are there plans to migrate the openssl package to 1.1.1?  
> 
> There are some efforts starting to bump to the latest stable 1.1.1.
> We're hoping we can get things bumped before things freeze for the
> next release.

The freeze for 2019.02 is going to happen at the end of January, I am
not sure this leaves us enough time to fix all the consequences of a
bump to OpenSSL 1.1.1.

However, since 2019.02 is going to be a LTS maintained for one year,
perhaps we want to have OpenSSL 1.1.1 in that LTS, knowing that it will
be maintained, while older OpenSSL versions might not. Is there any
information available on whether OpenSSL still maintains 1.0.x ? Peter,
what do you think ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
