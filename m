From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Nov 2018 11:20:52 +0100
Subject: [Buildroot] [PATCH 1/1] mpv: disable static build with qt-zlib
In-Reply-To: <f4c48e31-b230-5fbd-80d3-1504000852e3@mind.be>
References: <20181102182416.27015-1-fontaine.fabrice@gmail.com>
 <20181103142607.59465b91@windsurf>
 <f4c48e31-b230-5fbd-80d3-1504000852e3@mind.be>
Message-ID: <20181104112052.25dd15f1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 3 Nov 2018 23:15:00 +0100, Arnout Vandecappelle wrote:

>  Or maybe remove the QTZLIB option entirely.

Yeah, true. I'm not sure what is the motivation for using the
non-system zlib variant.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
