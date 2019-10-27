From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 09:52:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/supervisor: fix license
In-Reply-To: <20191027074114.29195-1-fontaine.fabrice@gmail.com>
References: <20191027074114.29195-1-fontaine.fabrice@gmail.com>
Message-ID: <20191027095245.221bb3fc@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 08:41:14 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> trackrefs module has been removed since version 4.0.0 and
> https://github.com/Supervisor/supervisor/commit/6c1c0adadaf190e77dc017a8a40c90249f0a055b
> 
> Since this removal, supervisor does not contain any ZPL-2.1 code
> anymore, see
> https://github.com/Supervisor/supervisor/commit/abff4cd872d2cbd1b999c1f439fdf83b4695cc6c
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/540303f884d9f891f58c660da22e2273956a92a6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/supervisor/supervisor.hash | 4 ++--
>  package/supervisor/supervisor.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
