From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 5 Oct 2019 16:18:28 +0200
Subject: [Buildroot] [PATCH] package/strace: fix no-MMU build
In-Reply-To: <e6e29275479f13cca01265870eb003908a0dd0f1.1570173186.git.baruch@tkos.co.il>
References: <e6e29275479f13cca01265870eb003908a0dd0f1.1570173186.git.baruch@tkos.co.il>
Message-ID: <acefe36f-4f31-7842-1d89-afa594101da1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/10/2019 09:13, Baruch Siach wrote:
> Add a patch removing fork() call when building for no-MMU targets.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d0300e9536cb470480d59eb7d64a3727d45d67bc/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

 Applied to master, thanks.

 Regards,
 Arnout
