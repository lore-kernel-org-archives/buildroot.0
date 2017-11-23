From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 23:07:03 +0100
Subject: [Buildroot] [PATCH v4 1/1] package/python-networkmanager: Bump
 to version 2.0.1
In-Reply-To: <20171104153458.6777-1-petr.vorel@gmail.com>
References: <20171104153458.6777-1-petr.vorel@gmail.com>
Message-ID: <20171123230703.1f46929c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Nov 2017 16:34:58 +0100, Petr Vorel wrote:
> Added new runtime dependency on python-six.
> 
> Dropped dbus-python as build time dependency (it's only runtime
> dependency).
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v3->v4:
> * Add comment about runtime.
> Changes v2->v3:
> * Dropped dbus-python as build time dependency (it's only runtime
> dependency).
> ---
>  package/python-networkmanager/Config.in                  |  3 ++-
>  package/python-networkmanager/python-networkmanager.hash |  6 +++---
>  package/python-networkmanager/python-networkmanager.mk   | 10 +++++-----
>  3 files changed, 10 insertions(+), 9 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
