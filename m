From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 12 Apr 2018 06:49:09 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-04-11
References: <20180412060058.042A020894@mail.bootlin.com>
Message-ID: <5acf2b9594d1f_203c2b0f110c8d48766ad@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Apr 12, 2018 at 03:00 AM, Thomas Petazzoni wrote:

> Results for branch 'master'
> dtv-scan-tables-07b18ecef17... | 10
> gst1-interpipe-10dba89eecc2... | 3 
> x264-7d0ff22e8c96de126be9d3... | 2 

I believe these are related to corner cases in the download of packages with
site method git.
I sent a short series that hopefully fixes some of these.
http://patchwork.ozlabs.org/project/buildroot/list/?series=38584

Regards,
Ricardo
