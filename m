From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Sep 2015 13:58:26 +0200
Subject: [Buildroot] [PATCH 1/1] openvpn: add option for
 --enable-password-save
In-Reply-To: <1443001188-8997-1-git-send-email-andreas.wetzel@nanotronic.ch>
References: <1443001188-8997-1-git-send-email-andreas.wetzel@nanotronic.ch>
Message-ID: <20150930135826.2f61326e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andreas Wetzel,

On Wed, 23 Sep 2015 11:39:48 +0200, Andreas Wetzel wrote:
> Added configuration option BR2_PACKAGE_OPENVPN_PWSAVE that
> adds --enable-password-save to OPENVPN_CONF_OPTS if selected.
> 
> Signed-off-by: Andreas Wetzel <andreas.wetzel@nanotronic.ch>
> ---
>  package/openvpn/Config.in  | 5 +++++
>  package/openvpn/openvpn.mk | 6 ++++++
>  2 files changed, 11 insertions(+)

Applied, thanks. I've just rewrapped the Config.in help text as
suggested by Vicente.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
