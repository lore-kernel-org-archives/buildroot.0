From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 23:37:30 +0200
Subject: [Buildroot] [PATCH] snmppp: extract license text from source
 files
In-Reply-To: <20150722213315.GC3777@free.fr>
References: <1437496184-26203-1-git-send-email-luca@lucaceresoli.net>
 <20150721215438.19389da8@free-electrons.com>
 <20150722210108.GB3777@free.fr>
 <20150722232613.149d5890@free-electrons.com>
 <20150722213315.GC3777@free.fr>
Message-ID: <20150722233730.4b9fc845@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 22 Jul 2015 23:33:15 +0200, Yann E. MORIN wrote:

> > The v3.cpp file is only 428 lines long, and weights 10260 bytes.
> > Comparatively, the GPLv2 text is 339 lines long for 18092 bytes, and
> > the GPLv3 text is 647 lines lon for 35147 bytes.
> > 
> > If you're really concerned about the file size used for the license of
> > snmppp, we could switch to use src/gauge.cpp instead of src/v3.cpp.
> > gauge.cpp is only 75 lines long, for 2804 bytes, and I'd say two thirds
> > of the file contents are license stuff.
> 
> It's not about the size of the file. It's just that I find it odd to use
> a source file as a license file.

If there's nothing better, then using a source file that carries a text
of the license is good enough to act as a license file, IMO.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
