From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Apr 2015 02:55:29 -0300
Subject: [Buildroot] [PATCH v2] uclibc: run snapshot and ng configs
	through "savedefconfig"
In-Reply-To: <1429544863-19143-1-git-send-email-abrodkin@synopsys.com>
References: <1429544863-19143-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <55388951.5050204@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/20/2015 12:47 PM, Alexey Brodkin wrote:

> Recently uClibc got support of "savedefconfig" target that allows
> generation of compact configuration description which only lists
> differences from default options.
> 
> That's uClibc commit -
> http://git.uclibc.org/uClibc/commit/?id=e286a674419d31cb0757dd2f8307d8b4756cf1f9
> 
> This change represents post-processing of "uClibc-snapshot.defconfig"
> and "uClibc-ng.config" with "make savedefconfig" made on current
> uClibc/master and uClibc-ng/1.0 branches accordingly.
> 
> Unfortunately the most recent stable uClibc version 0.9.33.2 doesn't
> have "savedefconfig" target so I'm leaving uClibc-0.9.33.config as it
> is.

Hi.
It looks good on principle, however can you respin it on top of
Waldermar's recent -ng version bump?
Thanks.
Regards.
