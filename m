From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jan 2015 19:16:55 +0100
Subject: [Buildroot] [PATCH] guile: needs autorecof
In-Reply-To: <1420738327-29085-1-git-send-email-gustavo@zacarias.com.ar>
References: <1420738327-29085-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150108191655.7b3329fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  8 Jan 2015 14:32:07 -0300, Gustavo Zacarias wrote:
> It's patching configure.ac and triggering an automatic autoreconf which
> doesn't end well. Fixes:
> http://autobuild.buildroot.net/results/14f/14f502687f6344a85e67b37efe9b00b8c586a266/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/guile/guile.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks. Unfortunately, I noticed the typo in the title right
after pushing :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
