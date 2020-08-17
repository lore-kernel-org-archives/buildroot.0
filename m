From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Aug 2020 12:18:52 +0200
Subject: [Buildroot] [PATCH v3,
 5/6] package/collectd: add capabilities option
In-Reply-To: <20200415063008.2237470-5-fontaine.fabrice@gmail.com>
References: <20200415063008.2237470-1-fontaine.fabrice@gmail.com>
 <20200415063008.2237470-5-fontaine.fabrice@gmail.com>
Message-ID: <20200817121852.4ce01484@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Apr 2020 08:30:07 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> capabilities plugin is available since version 5.11.0 and
> https://github.com/collectd/collectd/commit/b934f1572cdb54cf485b600546a72dbf9929ba2c
> 
> It is currently enabled by default depending on jansson and
> libmicrohttpd availability
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Thomas Petazzoni):
>  - Add dmidecode runtime dependency

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
