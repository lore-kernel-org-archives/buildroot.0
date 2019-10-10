From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 09:39:55 +0200
Subject: [Buildroot] [PATCH] utils/test-pkg: set the return code for fail
In-Reply-To: <20191010063933.30858-1-heiko.thiery@gmail.com>
References: <20191010063933.30858-1-heiko.thiery@gmail.com>
Message-ID: <20191010093955.491e55a7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 10 Oct 2019 08:39:33 +0200
heiko.thiery at gmail.com wrote:

> From: Heiko Thiery <heiko.thiery@kontron.com>
> 
> Add an option (-e) to exit the script with an error if a build
> or the legal-info check fails.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>

Why should this be optional? It seems like test-pkg should always
return a non-zero error code when the build or legal-info fails.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
