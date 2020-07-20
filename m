From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 20 Jul 2020 22:48:40 +0200
Subject: [Buildroot] [PATCH v1 3/3] package/uredir: new package
In-Reply-To: <20200714223620.4837f180@windsurf.home>
References: <20200714202407.23575-1-ps.report@gmx.net>
 <20200714202407.23575-3-ps.report@gmx.net>
 <20200714223620.4837f180@windsurf.home>
Message-ID: <20200720224840.1259502e@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, 14 Jul 2020 22:36:20 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Tue, 14 Jul 2020 22:24:07 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > The provided download hash ([1]) differes from actual one, so use
> > the locally calculated one.
>
> This is quite worrying. Did you report this upstream ?

Re-checked, it was my fault, did take the wrong download url/method, using
the right one fixes the match with the provided md5 sum, will re-send...

Regards,
Peter

>
> Thomas
