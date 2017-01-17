From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jan 2017 14:43:19 +1100
Subject: [Buildroot] [PATCH 1/2] package/efl: use "depends on" instead
 of "select" BR2_PACKAGE_EFL_WAYLAND
In-Reply-To: <20161230162250.2735-1-romain.naour@gmail.com>
References: <20161230162250.2735-1-romain.naour@gmail.com>
Message-ID: <20170117144319.36065aa3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Dec 2016 17:22:49 +0100, Romain Naour wrote:
> The efl Wayland support shouldn't selecte Wayland package itself.
> It must be an user decision, so use "depends on" instead.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/efl/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
