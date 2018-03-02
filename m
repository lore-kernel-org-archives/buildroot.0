From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Fri, 2 Mar 2018 07:08:55 -0500
Subject: [Buildroot] [PATCH 1/1] qt5webkit: fix build issue with 32-bits
 armv8-a
In-Reply-To: <20180302112652.GB8805@momiji>
References: <20180302105833.6828-1-gael.portay@savoirfairelinux.com>
 <20180302112652.GB8805@momiji>
Message-ID: <20180302120855.d6nfma3sqfc2wnnz@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adrian,

On Fri, Mar 02, 2018 at 11:26:52AM +0000, Adrian Perez de Castro wrote:
> Of course if qt5webkit does NOT use bmalloc, then you do not need the
> corresponding fix for it ? sorry, I don't know what's the qt5webkit situation
> in this regard, I have not been following it much since the Qt port was
> removed from the upstream WebKit source tree.
> 

qt5webkit uses bmalloc in 5.212.
