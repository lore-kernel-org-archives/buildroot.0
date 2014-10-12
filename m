From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 18:37:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: bump to version 0.8.3
In-Reply-To: <1413110453-20327-1-git-send-email-jkrause@posteo.de>
References: <1413110453-20327-1-git-send-email-jkrause@posteo.de>
Message-ID: <20141012183703.3108bb5b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sun, 12 Oct 2014 12:40:53 +0200, J?rg Krause wrote:
> Since version 0.8.2 upmpdcli builds with gcc >= 4.5. This allows compilation  
> with the CodeSourcery toolchain versions 2011.03 and 2010.09 for the PowerPC 
> architecture.
> 
> Signed-off-by: J?rg Krause <jkrause@posteo.de>

This version fails to build on x86-64:
http://autobuild.buildroot.org/results/7a6/7a67306839642468497b2fed963c27c077fc691d/build-end.log.
Don't know if it's a new problem or not.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
