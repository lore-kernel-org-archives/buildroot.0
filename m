From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Oct 2017 21:40:37 +0200
Subject: [Buildroot] [PATCH] tslib: add the hash for the COPYING license
 file
In-Reply-To: <20171002131216.5508-1-martink@posteo.de>
References: <20171002131216.5508-1-martink@posteo.de>
Message-ID: <20171002214037.0f8daac9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 Oct 2017 15:12:16 +0200, Martin Kepplinger wrote:
> Since tslib's COPYING file in part of the source tree, we can easily
> include it's hash for the given version here.
> 
> Signed-off-by: Martin Kepplinger <martink@posteo.de>
> ---
>  package/tslib/tslib.hash | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
