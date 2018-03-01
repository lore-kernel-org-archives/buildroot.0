From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Mar 2018 10:14:46 +0100
Subject: [Buildroot] QT5 camera error: Unknown module(s) in QT:
 multimedia multimediawidgets
In-Reply-To: <1519875639555-0.post@n4.nabble.com>
References: <1519875639555-0.post@n4.nabble.com>
Message-ID: <20180301101446.5d64784f@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Julia,

On Wed, 28 Feb 2018 20:40:39 -0700 (MST), Julia Ding wrote:
> I run qt camera demo, and it show this error
> 
> :-1: error: Unknown module(s) in QT: multimedia multimediawidgets
> 
> So I add qt5multimedia. (I'm using 'imx6-sabresd_qt5_defconfig' +
> qt5multimedia.)
> Then, build. Show this error:
> 
> Makefile:179: recipe for target 'sub-plugins-make_first' failed
> make[3]: *** [sub-plugins-make_first] Error 2
> Makefile:46: recipe for target 'sub-src-make_first' failed
> make[2]: *** [sub-src-make_first] Error 2
> 
> How to fix this? Thanks.

Thanks for your report. Could you:

 (1) Make sure this error happens when you do a rebuild from scratch
     ("make clean all")

 (2) Post the .config, and the last ~200 lines of build output. The
     part of the error log you have copy/pasted is not sufficient to
     understand the issue.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
