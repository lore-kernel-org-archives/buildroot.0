From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 15:39:33 +0200
Subject: [Buildroot] [PATCH v2] package/cups-filters: fix build without
 NLS
In-Reply-To: <20190919034717.18806-1-unixmania@gmail.com>
References: <20190919034717.18806-1-unixmania@gmail.com>
Message-ID: <864faa69-41a8-2eb5-f358-806a1ba16910@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/09/2019 05:47, unixmania at gmail.com wrote:
> From: Carlos Santos <unixmania@gmail.com>
> 
> texttotext must be linked to libiconv if !BR2_ENABLE_LOCALE so pull a
> patch applied upstream that adds libiconv discovery via autoconf.
> 
> With this change, autoreconf requires the config.rpath and ABOUT-NLS
> files which are not in v1.25.4. Add a pre-configure hook to fake them.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=12031
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout
