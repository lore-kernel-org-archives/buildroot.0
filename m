From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 15:51:59 +0200
Subject: [Buildroot] [PATCH 4/7] busybox.mk: fix unexpected indent with
 tabs.
In-Reply-To: <20170421152452.11236-4-aduskett@codeblue.com>
References: <20170421152452.11236-1-aduskett@codeblue.com>
 <20170421152452.11236-4-aduskett@codeblue.com>
Message-ID: <20170422155159.471991ee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Apr 2017 11:24:49 -0400, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>
> ---
>  package/busybox/busybox.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

The commit title was not properly formatted:

 - The prefix should have been "busybox:" or "package/busybox:"

 - No final dot

Applied with this fixed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
