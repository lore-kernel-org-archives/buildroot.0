From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Feb 2016 21:47:13 +0100
Subject: [Buildroot] [PATCH v3 05/17] python-pynacl: new package
In-Reply-To: <CAGm1_kthQFuNOXnZwsq3=fw_QN1vDt5NU3633W5Sy9RBBABw8Q@mail.gmail.com>
References: <1454696337-9692-1-git-send-email-mc5686@mclink.it>
 <1454696337-9692-6-git-send-email-mc5686@mclink.it>
 <CAGm1_kthQFuNOXnZwsq3=fw_QN1vDt5NU3633W5Sy9RBBABw8Q@mail.gmail.com>
Message-ID: <20160205214713.62970ade@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor,

On Fri, 5 Feb 2016 20:25:39 +0100, Yegor Yefremov wrote:
> On Fri, Feb 5, 2016 at 7:18 PM, Mauro Condarelli <mc5686@mclink.it> wrote:
> > Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> 
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

You did not review carefully enough it seems :-)

> > diff --git a/package/Config.in b/package/Config.in
> > index 7b5c747..f46daea 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -687,6 +687,8 @@ menu "External python modules"
> >         source "package/python-pygame/Config.in"
> >         source "package/python-pygments/Config.in"
> >         source "package/python-pyinotify/Config.in"
> > +       source "package/python-pynacl/Config.in"
> > +       source "package/python-pyopenssl/Config.in"

See here :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
