From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 22:17:47 +0100
Subject: [Buildroot] [PATCH/next 1/1] pulseview: drop boost thread
In-Reply-To: <20181201221615.17298-1-fontaine.fabrice@gmail.com>
References: <20181201221615.17298-1-fontaine.fabrice@gmail.com>
Message-ID: <20181206221747.6f81e38c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Dec 2018 23:16:15 +0100, Fabrice Fontaine wrote:
> Since bump to 0.4.0, boost thread is not needed anymore:
> https://sigrok.org/gitweb/?p=pulseview.git;a=commit;h=b8f1cdeba7cf6c2b749ff60102ce4e260fa1309e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pulseview/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
