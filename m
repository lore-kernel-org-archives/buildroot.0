From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Nov 2016 18:18:02 +0100
Subject: [Buildroot] [PATCHv2] legacy: add entries for renamed/removed
 MIPS CPU cores
In-Reply-To: <20161113175513.3c763f0d@free-electrons.com>
References: <1479052521-27651-1-git-send-email-yann.morin.1998@free.fr>
 <20161113175513.3c763f0d@free-electrons.com>
Message-ID: <20161113171802.GE3580@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-11-13 17:55 +0100, Thomas Petazzoni spake thusly:
> On Sun, 13 Nov 2016 16:55:21 +0100, Yann E. MORIN wrote:
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> 
> This is not necessary, and has already been discussed by Arnout during
> the review of Vicente patches. Those MIPS core options have been added
> and renamed within the 2016.11 release cycle, so there is no point in
> having legacy handling, since no Buildroot release ever had the old
> name for these.

Wooops... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
