From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 17:08:17 +0100
Subject: [Buildroot] [git commit master 1/1] cdrkit: fix build with
 ccache
In-Reply-To: <20110120202551.3757C8B537@busybox.osuosl.org>
References: <20110120202551.3757C8B537@busybox.osuosl.org>
Message-ID: <20110124170817.628499e6@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Jan 2011 21:23:23 +0100
Peter Korsgaard <jacmet@sunsite.dk> wrote:

> Cmake gets confused about ccache, so don't use ccache for cmake builds.

Which problems did you had exactly ?

While this is obviously the right short-term fix, it's a bit of a shame
of CMake doesn't play well with ccache, so maybe it's something I could
raise on the CMake mailing-list.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
