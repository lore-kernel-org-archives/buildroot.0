From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 22:19:02 +0200
Subject: [Buildroot] [PATCH 1/3] libselinux: target python interface
 generation
In-Reply-To: <1492056974-1773-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1492056974-1773-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20170413221902.71ac06a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Apr 2017 23:16:12 -0500, Matt Weber wrote:
> Fixed a consistancy issue between toolchain revisions.

This sentence didn't make much sense, so I've reworded the commit log.

> Moves the swig and pywrap step seperate from the overall
> build "all".
> 
> Resolves:
> http://autobuild.buildroot.net/results/967/967b74d0ae5b4b83ea2729217b005a3e1e4514d0/
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/libselinux/libselinux.mk | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)

Applied to master after doing tweaks to the commit log, and a few minor
things in the patch itself (comment and variable name).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
