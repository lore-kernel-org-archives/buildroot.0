From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:07:43 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/python-pip: bump to version
 19.2.3
In-Reply-To: <20190916165125.80333-1-aduskett@gmail.com>
References: <20190916165125.80333-1-aduskett@gmail.com>
Message-ID: <20190917220743.0c4efb65@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Sep 2019 09:51:25 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Also:
>   Select PYTHON_SSL or PYTHON3_SSL as pip connects to https://pypi.org
>   making SSL mandatory for runtime.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Impliment python-ssl selection logic. (Thomas)
>   - Add a newline before SoB line. (Thomas)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
