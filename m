From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 09:48:45 +0100
Subject: [Buildroot] [PATCH 1/1] postgresql: bump to 10.1
In-Reply-To: <20171125171214.11641-1-Adamduskett@outlook.com>
References: <20171125171214.11641-1-Adamduskett@outlook.com>
Message-ID: <20171127094845.570ce5e2@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Nov 2017 12:12:14 -0500, Adam Duskett wrote:
> changes:
> 
> - Add a hash for the license file.
> 
> - PostgreSQL 10.0 and above will default to checking for /dev/urandom if an
>   SSL library is not found, which will fail when cross compiling.
>   Since /dev/urandom is guaranteed to be provided on Linux systems,
>   add ac_cv_file__dev_urandom=yes to the configure environment if a SSL library
>   is not selected.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
> Changes v1 -> v2:
>   - Remove --disable-strong-random in place of ac_cv_file__dev_urandom=yes
>     in the case of a SSL library not being selected. (Thomas)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
