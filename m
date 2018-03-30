From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Fri, 30 Mar 2018 16:01:16 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/piglit: new package
In-Reply-To: <20180211162136.15605-3-romain.naour@gmail.com>
References: <20180211162136.15605-1-romain.naour@gmail.com>
 <20180211162136.15605-3-romain.naour@gmail.com>
Message-ID: <739caac0-526a-12b6-1934-bf0e9ebe52d8@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/02/2018 17:21, Romain Naour wrote:
> Piglit is an open-source test suite for OpenGL implementations.
> It's an python3 script based around several tools like glxinfo,
> wflinfo, dmesg.
>
> Even though waffle support can be replaced by freeglut,
> using pliglit with waffle is recommended since freeglut
> will be replaced by waffle.
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> Bernd, I'm Cc you since you're probably interested by piglit to
> test new mesa3d version.
>
> v2: bump version
> ---

Tested on AMD SUMO with Gallium r600 driver.

Tested-by: Valentin Korenblit <valentin.korenblit@smile.fr>
