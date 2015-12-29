From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 17:45:04 +0100
Subject: [Buildroot] [PATCH 1/1] Allow imagemagick to find ghostscript
 fonts.
In-Reply-To: <1434420746-20199-1-git-send-email-grepper@gmail.com>
References: <1434420746-20199-1-git-send-email-grepper@gmail.com>
Message-ID: <20151229174504.1ab322da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Robert,

Sorry for the long delay in replying to your patch.

On Mon, 15 Jun 2015 22:12:26 -0400, grepper wrote:

> It appears that Imagemagick needs to be configured with
>  --with-gs-font-dir=/usr/share/fonts/gs else it will not find
> the ghostscript fonts and /etc/ImageMagick-6/type-ghostscript.xml
> will contain the wrong font paths. You end up with messages like:
> Magick: unable to read font `(null)' @ error/annotate.c/RenderFreetype/1153
> They are non-fatal but could get annoying fast if you are using 'convert'
> on a lot of files.

Could you give a specific example use of imagemagick that triggers this
problem, so that we can reproduce the problem on our side and
investigate the possible solutions?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
