From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 16 Oct 2018 20:50:56 -0300
Subject: [Buildroot] Connection refused error
In-Reply-To: <CAD8kTsAZSoQQ3d-MX2u8CpqpahFbUYgJqoM92uoqcfHEDHg4DQ@mail.gmail.com>
References: <CAD8kTsAZSoQQ3d-MX2u8CpqpahFbUYgJqoM92uoqcfHEDHg4DQ@mail.gmail.com>
Message-ID: <CAOMZO5AEXRTcCLm9TmWQ0YUc+7gpMyDfjvMJtCtd388YwPQukQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Shaikat,

On Tue, Oct 16, 2018 at 8:27 PM Shaikat Hossain <shossa3@gmail.com> wrote:
>
> I am receiving the following error when I run make on the Erpiam project I am building from Github:
>
> "
> shaikat at shaikat-VirtualBox:~/erpiam$ make
> >>> host-expat 2.2.5 Downloading
> --2018-10-16 15:59:34--  http://downloads.sourceforge.net/project/expat/expat/2.2.5/expat-2.2.5.tar.bz2
> Connecting to 127.0.0.1:8080... failed: Connection refused.
> --2018-10-16 15:59:34--  http://sources.buildroot.net/expat-2.2.5.tar.bz2
> Connecting to 127.0.0.1:8080... failed: Connection refused.
> package/pkg-generic.mk:133: recipe for target '/home/shaikat/erpiam/output/build/host-expat-2.2.5/.stamp_downloaded' failed
> make: *** [/home/shaikat/erpiam/output/build/host-expat-2.2.5/.stamp_downloaded] Error 1
> "
>
> Can anyone advise on what may be the cause/solutions to this problem? I'm kind of stuck on this right now.

Does a simple "wget
http://downloads.sourceforge.net/project/expat/expat/2.2.5/expat-2.2.5.tar.bz2"
work for you?

Maybe you have a firewall issue?
