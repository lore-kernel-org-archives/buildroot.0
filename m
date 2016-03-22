From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Mar 2016 00:04:42 +0100
Subject: [Buildroot] [PATCH] gtkmm3: depends on libgtk3
In-Reply-To: <1458687397-1678-1-git-send-email-gustavo@zacarias.com.ar>
References: <1458687397-1678-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160323000442.7bf60277@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Mar 2016 19:56:37 -0300, Gustavo Zacarias wrote:
> packages shouldn't select libgtk3 directly, just depend on it, like for
> libgtk2.
> In the past libgtk3 didn't require any *GL backend and the dead-end
> solution/last resort was the broadway (networked) gdk backend - though
> not very useful it didn't require any funky dependencies.
> But now we do. Fixes:
> http://autobuild.buildroot.net/results/794/794c7ed221432e46a810fc281732ba417cd4cda3/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gtkmm3/Config.in | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
