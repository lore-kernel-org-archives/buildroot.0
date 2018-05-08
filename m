From: Matthew Weber <matt@thewebers.ws>
Date: Tue, 08 May 2018 00:56:17 +0000
Subject: [Buildroot] Analysis of build results for 2018-05-06
In-Reply-To: <20180507234635.4d21612b@windsurf>
References: <20180507060023.E26CE207B7@mail.bootlin.com>
 <20180507234635.4d21612b@windsurf>
Message-ID: <CAFt09wMuFXc7cijYZzj0i7cxvKmcCnLkdsoOnkCn5TOfNBSuMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, May 7, 2018 at 4:46 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

[snip]
> > microblazeel |                         libnss | TIM |
http://autobuild.buildroot.net/results/c973d3a73b5ce75d678e4419c5db2dcf9016aa29
|

> Also causes compiler hangs on Microblaze it seems:

>    http://autobuild.buildroot.net/?reason=libnss

> Anybody to see whether this issue is fixed with gcc 7.x or gcc 8.x ?

Seems to build fine with 7.x and I rebuild with 6.x to confirm that 6.x
still hangs/fails.
