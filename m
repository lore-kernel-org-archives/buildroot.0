From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Jul 2014 22:01:11 +0200
Subject: [Buildroot] i.MX 3.10.17 updates
In-Reply-To: <53BEEF7D.4020208@boundarydevices.com>
References: <53BEDF43.9020401@boundarydevices.com>
 <726E1478A66AD646A8419562133B4C3D0EB71DFB@mxadeneo.adeneo-embedded.us>
 <CADCpmyOhiNWv31pdUi5=Q3n-vD9jiFO_8d3v61ZqAa6yaxLy9A@mail.gmail.com>
 <53BEEF7D.4020208@boundarydevices.com>
Message-ID: <20140710200111.GG28300@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-07-10 12:54 -0700, Eric Nelson spake thusly:
> On 07/10/2014 12:01 PM, Gary Bisson wrote:
> > Resend my e-mail with the correct e-mail address so the mailing-list can
> > see it:
> > 
> > On Thu, Jul 10, 2014 at 11:53 AM, BISSON Gary
> > <gbisson at adeneo-embedded.us <mailto:gbisson@adeneo-embedded.us>> wrote:
> > 
> >     Hi Eric,
> > 
> >     Please find attached both my buildroot and my kernel config.
> >     I was using a code sourcery 2013.05 toolchain for my testing.
> >     Regarding GStreamer, might just be a missing plugin not necessarily
> >     related to the fsl one. Hope my config will help.
> > 
> 
> This is the config I started with, so I suspect that you'll also have
> difficulties playing video.
> 
> Hadrien and Yann, have you been able to validate video encode/decode?

No, I have no i.MX6 target, so I can't run-test. All I can do is
test-build the series. I sent Hadrien an updated (aka fixed) defconfig
for the wandboard, so he can test on the one he has.

Last Hadrien reported, he had trouble running the samples on his
wandboard, which is a revision A0.

We suspect there are hardware issues on the A0, so Hadrien was to test
on another i.MX6 board.

Hadrien, did you have time to conclude your testing?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
