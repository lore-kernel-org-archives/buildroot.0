From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 16:41:42 +0100
Subject: [Buildroot] [PATCH v2 2/4] package/python3: enable openssl
 support
In-Reply-To: <20191027153853.23532-2-nicolas.carrier@orolia.com>
References: <20191027153853.23532-1-nicolas.carrier@orolia.com>
 <20191027153853.23532-2-nicolas.carrier@orolia.com>
Message-ID: <20191027164142.448565b4@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 15:39:08 +0000
Nicolas Carrier <nicolas.carrier@orolia.com> wrote:

> If a python script is ran or used as (or in) a custom script like post
> build, but requires ssl, then it will fail since it's explicitly disabled
> by default.
> 
> This patch enables it unconditionnally.
> 
> Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
> 
> ---
> 
> Changes v1 -> v2:
>   - split the two original patches in two
>   - removed the ssl support option

I don't understand. Why did you drop the SSL option ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
