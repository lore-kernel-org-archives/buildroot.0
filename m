From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 23:41:06 +0100
Subject: [Buildroot] [PATCH v2 1/3] vala: add vala/valac wrapper
In-Reply-To: <1457529345-24041-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457529345-24041-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160322234106.5a254ee2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 Mar 2016 10:15:43 -0300, Gustavo Zacarias wrote:
> vala/valac can use gir and vapi data files installed by other packages,
> but since these are normally installed to staging and host-vala looks
> for them in the host directory (logically) this leads to failure.
> So wrap them to call the real tool and add this information via
> command-line parameters to them.
> 
> This is required for vala-in-vala bindings (vapi).
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
> v2: make wrapper relocatable and less SEDs

All three patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
