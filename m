From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 15:54:32 +0200
Subject: [Buildroot] [PATCH v2 1/2] bitstream: new package
In-Reply-To: <1445171651-28330-1-git-send-email-julian@jusst.de>
References: <1445171651-28330-1-git-send-email-julian@jusst.de>
Message-ID: <20151018155432.7a190342@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Julian Scheel,

On Sun, 18 Oct 2015 14:34:10 +0200, Julian Scheel wrote:
> BiTStream is a set of headers to ease processing of mpeg ts streams. It is
> used by dvblast.
> 
> Signed-off-by: Julian Scheel <julian@jusst.de>
> ---
> Changelog v2:

Applied after doing some additional changes:

    [Thomas:
     - add missing hash file.
     - add missing BITSTREAM_LICENSE_FILES information.
     - rewrap Config.in help text.
     - use lowercase name for the package in the comment header in
       bitstream.mk.]
    

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
