From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 15:26:33 +0100
Subject: [Buildroot] [PATCH 1/2 v2] docs: prepare moving the website
In-Reply-To: <80599fbbc0b35a4caec0ce971940322c388cd3a3.1422054324.git.yann.morin.1998@free.fr>
References: <cover.1422054324.git.yann.morin.1998@free.fr>
 <80599fbbc0b35a4caec0ce971940322c388cd3a3.1422054324.git.yann.morin.1998@free.fr>
Message-ID: <20150125152633.4e5fb396@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 24 Jan 2015 00:05:54 +0100, Yann E. MORIN wrote:
> This commit just creates a symlink so the website is now accessible from
> both docs/ and docs/website/.
> 
> This allows us to have the website now officially in docs/website, while
> still keep backward compatibility with the current scripts that update
> the website. Once those scripts have been updated, we'll be able to truly
> move the website to docs/website/ for good.
> 
> All without any perceived downtime or missed updated on the website! :-)
> 
> After an idea from Peter.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Applied, thanks.

Let's wait for this commit to be picked up by the server, change the
server configuration, and apply the second commit. Let me know when it
is OK to apply the second commit in this series.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
