From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 07 Aug 2014 17:37:16 -0300
Subject: [Buildroot] [PATCH 1/1] wpa-supplicant: Add NL80211 support
	option
In-Reply-To: <1407443308-20000-1-git-send-email-jtheou@adeneo-embedded.us>
References: <1407443308-20000-1-git-send-email-jtheou@adeneo-embedded.us>
Message-ID: <53E3E37C.3080605@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/07/2014 05:28 PM, Jean-Baptiste Theou wrote:

> Signed-off-by: Jean-Baptiste Theou <jtheou@adeneo-embedded.us>
> ---
>  package/wpa_supplicant/Config.in         | 6 ++++++
>  package/wpa_supplicant/wpa_supplicant.mk | 6 ++++++
>  2 files changed, 12 insertions(+)

Hi.
Hmmm why?
This is done automatically if the libnl package is selected/around.
We really don't want to thread too thin into hostapd & wpa_supplicant
config options.
Regards.
