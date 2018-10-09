From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 14:45:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/gettext-tiny: Add new package
In-Reply-To: <20180821142226.2309-1-vadim4j@gmail.com>
References: <20180821142226.2309-1-vadim4j@gmail.com>
Message-ID: <20181009144504.0ba21729@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadim,

On Tue, 21 Aug 2018 17:22:26 +0300, Vadim Kochan wrote:
> From: Vadim Kochan <vadim.kochan@petcube.com>
> 
> Add gettext-tiny package from the sabotage-linux project:
> 
> gettext-tiny provides lightweight replacements for tools typically used
> from the GNU gettext suite, which is incredibly bloated and takes a lot
> of time to build (in the order of an hour on slow devices). the most
> notable component is msgfmt which is used to create binary translation
> files in the .mo format out of textual input files in .po format. this
> is the most important tool for building software from source, because it
> is used from the build processes of many software packages.
> 
> Signed-off-by: Vadim Kochan <vadim.kochan@petcube.com>

Have you been able to make further progress on packaging gettext-tiny
as an alternative to the full gettext ? This is definitely something
I'd like to see integrated in Buildroot, so let us know if you are
still working or not, or if someone else needs to step up/help.

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
