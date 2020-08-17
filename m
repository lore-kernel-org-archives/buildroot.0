From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Aug 2020 12:18:56 +0200
Subject: [Buildroot] [PATCH v3,
 6/6] package/collectd: add buddyinfo option
In-Reply-To: <20200415063008.2237470-6-fontaine.fabrice@gmail.com>
References: <20200415063008.2237470-1-fontaine.fabrice@gmail.com>
 <20200415063008.2237470-6-fontaine.fabrice@gmail.com>
Message-ID: <20200817121856.6554bd5c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Apr 2020 08:30:08 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> buddyinfo is available since version 5.11.0 and
> https://github.com/collectd/collectd/commit/cb19ecf90d89a79836b8b5236d2b66277dd79c5f
> 
> It is currently enabled by default
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Asaf Kahlon):
>  - Add missing COLLECTD_ prefix for buddyinfo option in Config.in

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
