From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 22:15:23 +0100
Subject: [Buildroot] [PATCH 2/8] package/libiio: update cmake code for
 libxml2 detection
In-Reply-To: <1422220435-18689-3-git-send-email-s.martin49@gmail.com>
References: <1422220435-18689-1-git-send-email-s.martin49@gmail.com>
 <1422220435-18689-3-git-send-email-s.martin49@gmail.com>
Message-ID: <20150214221523.333c1fe4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 25 Jan 2015 22:13:49 +0100, Samuel Martin wrote:
> Only check for libxml2 when it is needed.
> 
> This prevents CMake from falling back on the libxml2-config.cmake
> installed on the host system (i.e. when libxml2 >=2.9.2 is part of the
> host system), but not enabled as a target package (i.e. not existing in
> the staging tree).
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  ...l2-detection-try-first-the-CMake-module-f.patch | 40 +++++++++++++---------
>  1 file changed, 23 insertions(+), 17 deletions(-)

Is this fixing a bug happening in practice? I.e should it be applied to
master or next?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
