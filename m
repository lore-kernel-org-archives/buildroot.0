From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 05 Apr 2010 19:58:10 +0300
Subject: [Buildroot] [git commit master] matchbox: convert to autotools,
 fix build with start-notification, libxft
In-Reply-To: <20100405092238.EDD8888D31@busybox.osuosl.org>
References: <20100405092238.EDD8888D31@busybox.osuosl.org>
Message-ID: <4BBA16A2.7050701@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/05/2010 11:47 AM, Will Wagner wrote:
>
> commit: http://git.buildroot.net/buildroot/commit/?id=f94830d0e5a409b2e2dc30a4e002c180fe09ec4e
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Signed-off-by: Will Wagner<will_wagner@carallon.com>
> Signed-off-by: Peter Korsgaard<jacmet@sunsite.dk>

Previously matchbox-commons were installed, now there is even no way to select
it, but .mk file is there :)
Don't know if it should be selectable or just added to root matchbox.mk...

BR,
Paulius
