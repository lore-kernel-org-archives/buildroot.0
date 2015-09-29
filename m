From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Sep 2015 19:48:10 +0200
Subject: [Buildroot] [PATCH 1/4] libssh/libssh.mk:normalize header
 separator size to 80
In-Reply-To: <1443475644-5320-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1443475644-5320-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20150929194810.3d3e1aad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Mon, 28 Sep 2015 23:27:21 +0200, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
>  package/libssh/libssh.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've applied all four patches. However, the commit title was not
exactly correct, it should have been:

	<package>: <description>

While in your case, it was:

	<filename>:<description>

So, I've tweaked your commits to have the following titles:

libssh: indentation cleanup in Config.in
libssh: indentation cleanup in .mk file
libssh: remove an extra '#' sign in the header package name
libssh: normalize header separator size to 80

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
