From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 2 Apr 2017 11:38:26 -0300 (BRT)
Subject: [Buildroot] [PATCH v2] e2fsprogs: keep util-linux's fsck
	if	chosen
In-Reply-To: <1429239756.17288393.1491143437663.JavaMail.zimbra@datacom.ind.br>
References: <1491100601-7867-1-git-send-email-casantos@datacom.ind.br>
 <CAGduivzA9WoMy4xGiad0VXXQ3W0ekXF9U37wwfwXsXapt3J7LQ@mail.gmail.com>
 <263644142.17286378.1491134582819.JavaMail.zimbra@datacom.ind.br>
 <CAGduivyWyX-d_hCJKaVi5LWLP33W+4Hc8G64myJf81ZWqHBEHg@mail.gmail.com>
 <1429239756.17288393.1491143437663.JavaMail.zimbra@datacom.ind.br>
Message-ID: <408746197.17288398.1491143906343.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Carlos Santos" <casantos@datacom.ind.br>
> To: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Sunday, April 2, 2017 11:30:37 AM
> Subject: Re: [Buildroot] [PATCH v2] e2fsprogs: keep util-linux's fsck if	chosen

> like e2fsprogs does. However, util-linux installs fsck unconditionally
> while busybox avoids overriding an existing /sbin/fsck, so their build
> and installation should be irrelevant. A good test is to run

build and installation *order* should be irrelevant

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
