From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 22:48:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/pipewire: needs headers >= 3.18
In-Reply-To: <20210425193742.3094686-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 25 Apr 2021 21:37:42 +0200")
References: <20210425193742.3094686-1-fontaine.fabrice@gmail.com>
Message-ID: <87o8e0g4ce.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > v4l2 plugin needs headers >= 3.18 since
 > https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/4cb90f3b868e5169cb9bfe2200f3b079d3f0db7b
 > (so since its addition to buildroot in commit
 > 75c86f90c73c42ee35559610aec28a02190b65b7) because of
 > V4L2_PIX_FMT_ARGB555X which is only available since
 > https://github.com/torvalds/linux/commit/fcc0d3db28922f9ba21ea6c7b23ea10ffb5d3521

 > v4l2 plugin can't be disabled until
 > https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/8d71d2dab831b77cadb74f2e4630f549acc94ac4

 > Fixes:
 >  - http://autobuild.buildroot.org/results/b887b6ccd2c22bb3214c07d1281ad486438fb58e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
