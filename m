From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 29 Apr 2019 23:01:30 +0200
Subject: [Buildroot] [DRAFT v1 1/7] package/gstreamer1: convert to meson
 build
In-Reply-To: <d13454c7-6438-c4b6-8208-c3bfbc0692d9@mind.be>
References: <20190429194534.25743-1-ps.report@gmx.net>
 <20190429194534.25743-2-ps.report@gmx.net>
 <d13454c7-6438-c4b6-8208-c3bfbc0692d9@mind.be>
Message-ID: <20190429230130.6d5bd171@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Mon, 29 Apr 2019 22:52:59 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 29/04/2019 21:45, Peter Seiderer wrote:
> > +	-Dcheck=$(if $(BR2_PACKAGE_GSTREAMER1_TRACE),enabled,disabled) \
>
>  Is this intended? Or should it be _CHECK?

Ups, you are right, will fix it in the next patch iteration, thanks for review...

Regards,
Peter

>
>  Regards,
>  Arnout
