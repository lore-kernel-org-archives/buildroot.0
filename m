From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 23:31:15 +1300
Subject: [Buildroot] [PATCH] openvpn: bump version to 2.4.0
In-Reply-To: <20170109161342.7853-1-Vincent.Riera@imgtec.com>
References: <20170109161342.7853-1-Vincent.Riera@imgtec.com>
Message-ID: <20170124233115.1dfe5790@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 9 Jan 2017 16:13:42 +0000, Vicente Olivert Riera wrote:
> --enable-password-save option has been removed
>   https://github.com/OpenVPN/openvpn/commit/9ffd00e7541d83571b9eec087c6b3545ff68441f
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

You're removing an option, but forgot to explain why Config.in.legacy
handling is not needed. I've added an explanation in the commit log,
and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
