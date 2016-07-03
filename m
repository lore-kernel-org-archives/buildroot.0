From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 10:29:19 +0200
Subject: [Buildroot] [PATCH] xcb-proto: add upstream patch for python3.5
 build failure
In-Reply-To: <1467506243-18432-1-git-send-email-arnout@mind.be>
References: <1467506243-18432-1-git-send-email-arnout@mind.be>
Message-ID: <20160703102919.22ec7558@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 3 Jul 2016 02:37:23 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Since we run compileall on all python files in TARGET_DIR as part of
> the finalization, the align.py from xcb-proto will be compiled (it is
> not compiled as part of the package build). This file contains mixed
> tab-spaces indentation, which python 3.5 no longer allows.
> 
> Add an upstream patch that cleans up the indentation in this file.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  .../0001-Make-whitespace-use-consistent.patch      | 212 +++++++++++++++++++++
>  1 file changed, 212 insertions(+)
>  create mode 100644 package/x11r7/xcb-proto/0001-Make-whitespace-use-consistent.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
