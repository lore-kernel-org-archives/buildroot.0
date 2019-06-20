From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 15:59:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: drop wchar dependency
 on IDN option
In-Reply-To: <20190619180903.2467-1-fontaine.fabrice@gmail.com>
References: <20190619180903.2467-1-fontaine.fabrice@gmail.com>
Message-ID: <20190620155903.3ac9b5d5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 19 Jun 2019 20:09:03 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> wchar dependency on IDN option has been added with commit
> 126a2e75f5948b30f842862906fca8ed99ffff26 because of libintl
> 
> However libintl dependency has been dropped with commit
> bbcbed1829057121f9f9459f62f913626206e823 so remove unneeded wchar
> dependency
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dnsmasq/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
