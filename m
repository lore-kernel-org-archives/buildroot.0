From: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Thu, 6 Sep 2018 03:32:21 -0400
Subject: [Buildroot] [PATCH v1 3/4] qt5virtualkeyboard: fix legal-info
 with 5.6
In-Reply-To: <20180905231134.46b70011@windsurf>
References: <20180903123747.5234-1-gael.portay@savoirfairelinux.com>
 <20180903123747.5234-4-gael.portay@savoirfairelinux.com>
 <20180905231134.46b70011@windsurf>
Message-ID: <20180906073221.6f75uwcwlrbhxyy3@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Sep 05, 2018 at 11:11:34PM +0200, Thomas Petazzoni wrote:
> (...)
> 
> > Conditionally remove LICENSE.GPL3 from QT5VIRTUALKEYBOARD_LICENSE_FILES
> > when Qt major version is set to 5.6.
> 
> Do we have any indication that the license is GPLv3 for the 2.0 version
> of qt5virtualkeyboard ?
> 

I found this [1]. I also asked to Qt and I am waiting for their
response.

I guess this Qt5 module is available in Open license since 5.7; thus 2.0
(5.6) is available only under their Commercial license.

> (...)
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

[1]: http://blog.qt.io/blog/2016/03/02/qt-virtual-keyboard-updated-with-handwriting-recognition/

Regards,
Ga?l
