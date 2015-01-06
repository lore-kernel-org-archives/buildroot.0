From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jan 2015 21:14:58 +0100
Subject: [Buildroot] [PATCH] dbus: security bump to version 1.8.14
In-Reply-To: <1420542132-12262-1-git-send-email-gustavo@zacarias.com.ar>
References: <1420542132-12262-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150106211458.254bc7b8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  6 Jan 2015 08:02:12 -0300, Gustavo Zacarias wrote:
> Fixes CVE-2014-8148 - If a system service installs unsafe security
> policy rules that allow arbitrary method calls then this prevents memory
> consumption and possible privilege escalation via
> UpdateActivationEnvironment.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/dbus/dbus.hash | 2 +-
>  package/dbus/dbus.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
