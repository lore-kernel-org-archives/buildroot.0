From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Feb 2014 13:33:54 +0100
Subject: [Buildroot] [PATCH 3/4] samba: convert to choice package
In-Reply-To: <52F87645.8000708@mind.be>
References: <1391806354-32698-1-git-send-email-gustavo@zacarias.com.ar>
 <1391806354-32698-4-git-send-email-gustavo@zacarias.com.ar>
 <52F87645.8000708@mind.be>
Message-ID: <20140210133354.09a2fc57@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Gustavo,

On Mon, 10 Feb 2014 07:48:37 +0100, Arnout Vandecappelle wrote:
> On 02/07/14 21:52, Gustavo Zacarias wrote:
> > Convert the classic samba package to a choice and move it to samba3 in
> > preparation for the samba4 package.
> > 
> > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> 
>  I don't like this rename. Why not keep the old samba package and add
> samba4 to it? If side-by-side installation is not possible, make samba4
> depend on !samba, like is done for qt5.

Yes, I would also prefer to keep the Samba package named as it is
today, and introduce Samba 4.x as a separate package, without touching
the existing Samba 3.x support (except maybe changing the short
description, and adding the depends on !samba as suggested by Arnout).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
