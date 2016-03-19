From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 15:00:57 +0100
Subject: [Buildroot] [PATCH] shared-mime-info: attempt to fix parallel
 build issues
In-Reply-To: <1457993466-15145-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457993466-15145-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160319150057.4ff8e519@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 14 Mar 2016 19:11:06 -0300, Gustavo Zacarias wrote:
> According to https://bugs.freedesktop.org/show_bug.cgi?id=46093 the
> problem lies with 'make check' which is enabled by default.
> But we don't care about running the check target, so disable it.
> It will hopefully finally fix, for target:
> http://autobuild.buildroot.net/results/03f/03fcc8aff675eb035e123eb2b01e4ed122c66cbc/
> For host:
> http://autobuild.buildroot.net/results/6c1/6c1fd50913ef8a3a5cc108f428f2c195c768324d/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/shared-mime-info/shared-mime-info.mk | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
