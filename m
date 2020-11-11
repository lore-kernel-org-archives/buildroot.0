From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Wed, 11 Nov 2020 07:08:09 +0100
Subject: [Buildroot] WiFi-Problem STM32MP157C-DK2
In-Reply-To: <AM9PR10MB4563302E866A6B542E93CC3F82E90@AM9PR10MB4563.EURPRD10.PROD.OUTLOOK.COM>
References: <AM9PR10MB4563302E866A6B542E93CC3F82E90@AM9PR10MB4563.EURPRD10.PROD.OUTLOOK.COM>
Message-ID: <CACna6rz64h0-P6ovH5Ed6+omb9aW+9gFBYZ0iREp+XaByGYM1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 11 Nov 2020 at 00:22, Kevin Tomary <kevin.tomary@hotmail.com> wrote:
> When I boot I get these errors
>
>
> Could not read interface wlan0 flags: No such device
>
> nl80211: Driver does not support authentication/association or connect commands
> nl80211: deinit ifname=wlan0 disabled_11b_rates=0
> Could not read interface wlan0 flags: No such device
> wlan0: Failed to initialize driver interface
> FAIL
> Starting dhcpcd...
> no interfaces have a carrier
> forked to background, child pid 171
> Starting sshd: OK
> Starting DHCP server: FAIL

They look like supplicant messages, not boot messages.

Does wireless PHY exist at all? Provide boot log.

-- 
Rafa?
