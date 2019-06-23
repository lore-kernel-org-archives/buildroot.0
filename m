From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 21:40:34 +0200
Subject: [Buildroot] [PATCHv3 1/2] utils/test-pkg: fix long option
 parsing
In-Reply-To: <20190205212142.2244-1-patrickdepinguin@gmail.com>
References: <20190205212142.2244-1-patrickdepinguin@gmail.com>
Message-ID: <20190623214034.5c9dc4fa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 Feb 2019 22:21:41 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> The long option parsing of test-pkg is broken because:
> - some long options are not declared
> - there should be a comma between long options, the colon does not replace
> it.
> 
> This change also revealed that the declaration of 'toolchains-dir' should
> have been 'toolchains-csv', originally introduced in commit ed59f81a3cb4ddb.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  utils/test-pkg | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Both patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
