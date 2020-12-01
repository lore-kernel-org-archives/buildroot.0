From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Dec 2020 23:32:19 +0100
Subject: [Buildroot] [PATCH 01/18] package/erlang-p1-utils: bump version
 to 1.0.20
In-Reply-To: <20201126174301.411219-1-johan.oudinet@gmail.com>
References: <20201126174301.411219-1-johan.oudinet@gmail.com>
Message-ID: <20201201233219.41f7acc3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Johan,

On Thu, 26 Nov 2020 18:42:44 +0100
Johan Oudinet <johan.oudinet@gmail.com> wrote:

> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  package/erlang-p1-utils/erlang-p1-utils.hash | 4 ++--
>  package/erlang-p1-utils/erlang-p1-utils.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

I have applied the whole series. However, three patches had incorrect
license file hashes: there were some copyright year changes in those
license files.

For the next version bumps, could you ensure to do a "make legal-info"
before sending the patch series ? This would have detected those
license file changes.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
