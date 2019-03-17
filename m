From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 17:31:20 +0100
Subject: [Buildroot] [PATCH 1/1] package-ipython: bump to version 7.3.0
In-Reply-To: <20190317152821.27489-1-fontaine.fabrice@gmail.com>
References: <20190317152821.27489-1-fontaine.fabrice@gmail.com>
Message-ID: <20190317173120.63229d31@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Mar 2019 16:28:21 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update hash for COPYING.rst, it has been updated to remove
>   BSD-3-Clause text:
>   https://github.com/ipython/ipython/commit/5a6ef3e35db9ac04bf47a17d96484e03370f03dd
> - Add LICENSE to license files as this is now the file that contain
>   BSD-3-Clause text
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-ipython/python-ipython.hash | 7 ++++---
>  package/python-ipython/python-ipython.mk   | 6 +++---
>  2 files changed, 7 insertions(+), 6 deletions(-)

Applied to master, thanks. The commit title had a typo, that I fixed up
when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
