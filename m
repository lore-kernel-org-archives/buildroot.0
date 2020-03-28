From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Mar 2020 14:59:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/hiredis: security bump to
 version 0.14.1
In-Reply-To: <20200328085230.899562-1-fontaine.fabrice@gmail.com>
References: <20200328085230.899562-1-fontaine.fabrice@gmail.com>
Message-ID: <20200328145900.6a87305b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Mar 2020 09:52:30 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Fix CVE-2020-7105: async.c and dict.c in libhiredis.a in hiredis
>   through 0.14.0 allow a NULL pointer dereference because malloc return
>   values are unchecked.
> - Update indentation of hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/hiredis/hiredis.hash | 4 ++--
>  package/hiredis/hiredis.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
