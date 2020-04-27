From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 21:23:03 +0200
Subject: [Buildroot] [PATCH] package/ebtables: bump to version 2.0.11
In-Reply-To: <20200426132940.25969-1-ryanbarnett3@gmail.com>
References: <20200426132940.25969-1-ryanbarnett3@gmail.com>
Message-ID: <20200427212303.4b4cb6ab@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 26 Apr 2020 08:29:40 -0500
Ryan Barnett <ryanbarnett3@gmail.com> wrote:

> With the version bump to 2.0.11, ebtables switch to autotools build
> system. In addition, ebtables-{restore/save} moved to being installed
> as ebtables-legacy-{restore/save}.
> 
> Changes to support this version bump include:
> 
>  * Utilize configure options for static library support
>  * Remove ebtables-restore config option as configure scripts checks
>    dependencies for ebtables-legacy-restore.

This does not really explain why we remove this option. What checks are
done? Why do these checks mean we have to remove this option?

I think it's a bit annoying to have an option for the "save" tool but
not the corresponding option for the "restore" tool.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
