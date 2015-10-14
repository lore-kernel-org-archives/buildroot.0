From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 10:40:40 +0200
Subject: [Buildroot] [PATCH v1] gst1-plugins-bad: update configure
 options
In-Reply-To: <1444774091-19539-1-git-send-email-ps.report@gmx.net>
References: <1444774091-19539-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151014104040.7c5709e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Wed, 14 Oct 2015 00:08:11 +0200, Peter Seiderer wrote:
> - add new onvif option
> - add new dtls option
> - add new openh264 option
> - add new x265 option
> - rename real option to rtp
> - remove legacy options: directdraw, osx_video, quicktime
>   and mythtv

When you remove legacy options, you should add them to Config.in.legacy
in the root directory of Buildroot. See the big comment at the
beginning of the file for details on how it is handled.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
