From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Nov 2015 14:04:42 +0100
Subject: [Buildroot] [PATCH] bullet: disable on microblaze
In-Reply-To: <1448140207-28861-1-git-send-email-arnout@mind.be>
References: <1448140207-28861-1-git-send-email-arnout@mind.be>
Message-ID: <20151122140442.6273cc59@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Sat, 21 Nov 2015 22:10:07 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> gcc doesn't finish compiling btSoftBody.cpp when optimization is
> enabled.
> 
> Fixes:
> http://autobuild.buildroot.net/results/6e4/6e4a9ede477b031f47f7e271c38f67f432a3573c
> http://autobuild.buildroot.net/results/7dc/7dc4ab759dd3b1e3e03fe52c78e31327340bf8c9
> http://autobuild.buildroot.net/results/637/637bae8b2be6c4c64f4f7c661cc8d4606b553538
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> An option would have been to disable optimisation, but I couldn't be
> bothered...
> ---
>  package/bullet/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

I've added a comment in the Config.in with a reference to the gcc bug
you have reported. Then, applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
