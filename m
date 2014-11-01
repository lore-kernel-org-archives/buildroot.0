From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Sat, 1 Nov 2014 18:06:24 +0100
Subject: [Buildroot] [PATCH 1/1] xinetd: change to snapshot.debian.org
 and add hash
In-Reply-To: <20141101180237.6b82f0f4@free-electrons.com>
References: <1414859755-33664-1-git-send-email-kaszak@gmail.com>
 <20141101180237.6b82f0f4@free-electrons.com>
Message-ID: <CABbD_XBrSqZmXw2BuM46dKZYbRyYvTOzP3LZgkMBfx7F=jLkaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm not sure, but that seems logical.
The sha256 sum from github.com differs from debian.org.
Which one to prefer?

Best regards,
Karoly

On Sat, Nov 1, 2014 at 6:02 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Karoly Kasza,
>
> On Sat,  1 Nov 2014 17:35:55 +0100, Karoly Kasza wrote:
>
> >  XINETD_VERSION = 2.3.15
> > -XINETD_SITE = http://www.xinetd.org
> > +XINETD_SOURCE = xinetd_$(XINETD_VERSION).orig.tar.gz
> > +XINETD_SITE =
> http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/x/xinetd
>
> Just wondering, isn't https://github.com/xinetd-org/xinetd the new
> appropriate upstream site?
>
> There is even a 2.3.15 release at
> https://github.com/xinetd-org/xinetd/releases.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 

?dv,
KK
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141101/57fc5e9b/attachment.html>
