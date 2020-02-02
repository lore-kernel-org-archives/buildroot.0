From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Feb 2020 09:52:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/libevent: do not drop python
 script with python 3
In-Reply-To: <20200122191438.55671-1-fontaine.fabrice@gmail.com>
References: <20200122191438.55671-1-fontaine.fabrice@gmail.com>
Message-ID: <20200202095239.33a84884@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Jan 2020 20:14:38 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> python script is compatible with python3 since 2.1.10 and
> https://github.com/libevent/libevent/commit/532a8cc301db39e82166b4fe98146534fdc242ce
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libevent/libevent.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
