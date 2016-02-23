From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 23:45:32 +0100
Subject: [Buildroot] [PATCH 1/1] libuci: correct lua path
In-Reply-To: <1455023857-27794-1-git-send-email-Neha.Bairathi@imgtec.com>
References: <1455023857-27794-1-git-send-email-Neha.Bairathi@imgtec.com>
Message-ID: <20160223234532.416b1458@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Neha Bairathi,

On Tue, 9 Feb 2016 18:47:37 +0530, Neha Bairathi wrote:
> LUAPATH is used as the path for installing lua binding.
> As buildroot specifies the install prefix, STAGING_DIR gets
> appended to TARGET_DIR which is incorrect path for installation,
> so use relative path.
> 
> Reviewed-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
> Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> Signed-off-by: Neha Bairathi <Neha.Bairathi@imgtec.com>
> ---
>  package/libuci/libuci.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks. Thanks Arnout for reviewing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
