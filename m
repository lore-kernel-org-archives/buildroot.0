From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Fri, 24 Oct 2014 10:36:10 +0800
Subject: [Buildroot] [PATCH] tftpd: Install TFTP client as well
In-Reply-To: <20141023221315.2d4f658a@free-electrons.com>
References: <1414062804-11701-1-git-send-email-keguang.zhang@gmail.com>
 <20141023221315.2d4f658a@free-electrons.com>
Message-ID: <CAJhJPsXx8+3nJoOWFx+u2RkvgaUSuJykDGzqS8jJ55UjTB+9QQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry for my negligence.
Thanks Thomas!

2014-10-24 4:13 GMT+08:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Kelvin Cheung,
>
> On Thu, 23 Oct 2014 19:13:24 +0800, Kelvin Cheung wrote:
> > This patch installs TFTP client as well and overrides
> > BusyBox implementations if BusyBox is enabled.
> >
> > Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
> > ---
> >  package/tftpd/tftpd.mk | 6 ++++++
> >  1 file changed, 6 insertions(+)
>
> Thanks, applied, after fixing the SYSKLOGD typo noticed by Baruch.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 
Best Regards!
Kelvin Cheung
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141024/20ebf3b7/attachment.html>
