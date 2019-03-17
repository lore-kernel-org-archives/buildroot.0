From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 11:37:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-pycares: bump to version
 3.0.0
In-Reply-To: <20190316031239.3805-1-james.hilliard1@gmail.com>
References: <20190316031239.3805-1-james.hilliard1@gmail.com>
Message-ID: <20190317113720.2e2d44d5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 16 Mar 2019 11:12:39 +0800
james.hilliard1 at gmail.com wrote:

> From: James Hilliard <james.hilliard1@gmail.com>
> 
> This version drops python 2 support and requires cffi.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pycares/Config.in           | 2 ++
>  package/python-pycares/python-pycares.hash | 4 ++--
>  package/python-pycares/python-pycares.mk   | 5 +++--
>  3 files changed, 7 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
