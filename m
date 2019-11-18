From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 22:16:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/domoticz: fix build with jsoncpp
In-Reply-To: <20191118202452.394708-1-fontaine.fabrice@gmail.com>
References: <20191118202452.394708-1-fontaine.fabrice@gmail.com>
Message-ID: <20191118221659.672565fb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Nov 2019 21:24:52 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> domoticz embeds its own version of jsoncpp that can clash with upstream
> jsoncpp so retrieve upstream commit that fix this issue
> 
> Build failures started after jsoncpp bumps from 1.8.4 to 1.9.1

Thanks a lot for including this explanation. It is precisely this type
of explanation that was sometimes missing in your previous patches, so
I'm very happy to see it in this patch.

> Fixes:
>  - http://autobuild.buildroot.org/results/a73406eb780a454369ea997654b6b4c6b3757a41
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
