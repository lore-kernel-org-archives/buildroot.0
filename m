From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 28 Oct 2019 14:12:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/libsigrok: fix libftdi support
In-Reply-To: <20191028140047.3d972481@windsurf>
References: <20191028112411.18817-1-fontaine.fabrice@gmail.com>
 <20191028140047.3d972481@windsurf>
Message-ID: <CAPi7W81=c31-u0TcTebeMWybuzXzC4PRm37ESoNjEJkqaBDuBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Le lun. 28 oct. 2019 ? 14:00, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Mon, 28 Oct 2019 12:24:11 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > libsigrok optionally depends on libftdi1 not libftdi
>
> Is this related to a recent change? When there's issue like this, it's
> good to track down why/when it started occurring rather than just
> fixing it "blindly", potentially papering over other issues.
It's related to the commit 01b30e5d69f080853731736336298f6f0fdf24ce
which fixes the configure options. Before this commit, this issue was
not seen by the autobuilders. From my understanding libsigrok is using
libftdi1 since a very long time.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
