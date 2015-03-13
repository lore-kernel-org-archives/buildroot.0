From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Mar 2015 19:08:55 -0300
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: Enable support
 for log to debug file
In-Reply-To: <1426197654-8183-1-git-send-email-joerg.krause@embedded.rocks>
References: <1426197654-8183-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <55035FF7.2070503@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/12/2015 07:00 PM, J?rg Krause wrote:

> Enables the '-f' option (log output to debug file instead of stdout) for
> wpa_supplicant.

Just force enable it, binary size +8 bytes for an ARM target, it doesn't
make sense to make it an option (specially since it must be used and
doesn't affect anything by default).
Regards.
