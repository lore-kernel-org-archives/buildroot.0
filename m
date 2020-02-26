From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 20:49:22 +0100
Subject: [Buildroot] [PATCH/next v2,
 1/1] package/kvm-unit-tests: drop x86_64 workaround
In-Reply-To: <20200225173028.349643-1-fontaine.fabrice@gmail.com>
References: <20200225173028.349643-1-fontaine.fabrice@gmail.com>
Message-ID: <20200226204922.4bc77233@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 25 Feb 2020 18:30:28 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This workaround is not needed since commit
> 0788e921f961e36a50a94f8bb98f7eb75b312245 which disables stack-protector
> for all architectures as intended by upstream
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Baruch Siach):
>  - Use positive logic

Applied to next, after cherry-picking
0788e921f961e36a50a94f8bb98f7eb75b312245 into next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
