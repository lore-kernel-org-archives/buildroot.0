From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 23:06:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvncserver: disable gtk
 example
In-Reply-To: <20200716193610.1924967-1-fontaine.fabrice@gmail.com>
References: <20200716193610.1924967-1-fontaine.fabrice@gmail.com>
Message-ID: <20200716230653.42c8ed86@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Jul 2020 21:36:10 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> gtkvncviewer has been added since version 0.9.13 and
> https://github.com/LibVNC/libvncserver/commit/2650cfc17bb7718e42bfff8510c15f011eda1b1f,
> disable it as it is only an example
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libvncserver/libvncserver.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
