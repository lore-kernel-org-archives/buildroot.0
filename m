From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 23:53:34 +0200
Subject: [Buildroot] [PATCH] sqlcipher: specify tclConfig.sh directory
In-Reply-To: <1444858917-17641-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444858917-17641-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151014235334.5e4699c3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 14 Oct 2015 18:41:57 -0300, Gustavo Zacarias wrote:
> Otherwise it will search around, and if the host has it then it breaks.
> Fixes:
> http://autobuild.buildroot.net/results/057/0572a9a1f69ee214efb10863f5d2852b25bf4f54/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/sqlcipher/sqlcipher.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
