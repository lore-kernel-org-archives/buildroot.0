From: Victor Huesca <victor.huesca@bootlin.com>
Date: Fri, 17 May 2019 12:05:48 +0200
Subject: [Buildroot] [PATCH] package/dhcpcd: bump version to 7.2.2
In-Reply-To: <20190517112628.0acd34d1@windsurf>
References: <20190517092232.27749-1-victor.huesca@bootlin.com>
 <20190517112628.0acd34d1@windsurf>
Message-ID: <418413d7-998b-8bf7-e38e-c2ea1d265404@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Fri, 17 May 2019 11:26 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> When the LICENSE file has changed, we like to have an explanation in
> the commit log about what changed. This way, we are sure the actual
> change in the license file has been verified by someone, especially to
> make sure that the license terms of the package have not changed.
> 
> Most of the time, the change is just that the copyright year has been
> updated, but it's always important to check that. So just do a diff
> between the old LICENSE and the new LICENSE file to see what the
> differences are, and summarize that in the commit log.

You're right it was just the copyright year that has been updated to
2019. I will submit a new patch according to it.

> Otherwise, looks good to me. Did you use ./utils/test-pkg to verify
> that everything was building fine for this package after the version
> bump ?

Yes, all test passed with success.

Victor

-- 
Victor Huesca, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
