From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 29 Nov 2006 11:30:42 +0100
Subject: [Buildroot] [PATCH] Update version of device-mapper,
	add alternate location
In-Reply-To: <1164774561.4016.87.camel@dv>
References: <1164774561.4016.87.camel@dv>
Message-ID: <20061129103042.GA27354@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 28, 2006 at 11:29:21PM -0500, Pavel Roskin wrote:
>Old versions of device-mapper are moved to the "old" directory.  Since
>new versions are released very often, tracking them would require
>frequent changes.
>
>To avoid the breakage, look in the "old" directory if the package is not
>found.

I don't like the idea of silently using an old version, but then, i
don't use dm myself.

Merged as r16713, thanks
