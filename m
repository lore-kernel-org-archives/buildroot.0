From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 15:56:54 +0100
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: add tilde '~'
 expansion for pathes
In-Reply-To: <20200307103704.20524-1-heiko.thiery@gmail.com>
References: <20200307103704.20524-1-heiko.thiery@gmail.com>
Message-ID: <20200307155654.12e93ddb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  7 Mar 2020 11:37:05 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> The script arguments 'nvd-path', 'json' and 'html' currently does not
> allow to have '~' in path for user home directory. With this patch
> this '~' is expanded to the real user home directory.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Isn't ~ supposed to be expanded by your shell before calling pkg-stats
? Here, pkg-stats --html ~/toto.html works perfectly fine without your
patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
