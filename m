From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 8 Nov 2019 21:54:01 +0100
Subject: [Buildroot] [PATCH 1/1] utils/scanpypi: sort alphabetically
 list of required packages
In-Reply-To: <20191108161043.342378-1-b.bilas@grinn-global.com>
References: <20191108161043.342378-1-b.bilas@grinn-global.com>
Message-ID: <20191108215401.2e9ca679@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  8 Nov 2019 17:10:43 +0100
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> That change will alphabetically set list order
> of required packages in Config.in file automatically.
> 
> Example below:
> 
> before: ['python-pyserial', 'python-pyaes', 'python-ecdsa']
> after:  ['python-ecdsa', 'python-pyaes', 'python-pyserial']
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  utils/scanpypi | 1 +
>  1 file changed, 1 insertion(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
