From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Dec 2019 15:15:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/cups: security bump to version
 2.3.1
In-Reply-To: <20191214105942.895486-1-fontaine.fabrice@gmail.com>
References: <20191214105942.895486-1-fontaine.fabrice@gmail.com>
Message-ID: <20191214151522.6be90e45@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 14 Dec 2019 11:59:42 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2019-2228: The ippSetValuetag function did not validate the
> default language value.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cups/cups.hash | 2 +-
>  package/cups/cups.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
