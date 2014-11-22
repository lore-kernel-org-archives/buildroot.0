From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 20:16:21 +0100
Subject: [Buildroot] [PATCH 7/9] manual: Remove dollar before command
 example
In-Reply-To: <1416068964-22529-7-git-send-email-maxime.hadjinlian@gmail.com>
References: <1416068964-22529-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1416068964-22529-7-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141122201621.4b137857@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sat, 15 Nov 2014 17:29:22 +0100, Maxime Hadjinlian wrote:
> In order to harmonize the manual, in some places there was a dollar
> before and other place did not have that dollar.
> 
> Made the choice to remove the dollar in order to facilitate copy/paste
> from the manual.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  docs/manual/common-usage.txt        | 12 ++++++------
>  docs/manual/make-tips.txt           | 12 ++++++------
>  docs/manual/quickstart.txt          | 10 +++++-----
>  docs/manual/rebuilding-packages.txt |  2 +-
>  4 files changed, 18 insertions(+), 18 deletions(-)

I agree with Yann here: I do prefer to have the $ sign to clearly
indicate that it's a shell command. So I've marked your patches 8 and 9
as rejected in patchwork.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
