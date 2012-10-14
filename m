From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Oct 2012 14:12:11 +0200
Subject: [Buildroot] [PATCH] pkg-avail: make it work without stgit
In-Reply-To: <20121014120311.GF29733@sapphire.tkos.co.il>
References: <1347234052-10527-3-git-send-email-yann.morin.1998@free.fr>
 <1350213261-4929-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20121014120311.GF29733@sapphire.tkos.co.il>
Message-ID: <201210141412.11675.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On Sunday 14 October 2012 Baruch Siach wrote:
> On Sun, Oct 14, 2012 at 01:14:21PM +0200, Thomas Petazzoni wrote:
> >  support/scripts/pkg-avail |   44 +++++++++++++++++++++++++++++++-------------
> >  1 file changed, 31 insertions(+), 13 deletions(-)
> 
> What branch is this patch based on? I can't find support/scripts/pkg-avail in 
> current master.

It's not based on a branch, it's to be applied on top of the patch that
adds this script in the _AVAILABLE patch series.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
