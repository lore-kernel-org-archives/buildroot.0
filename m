From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 18:32:14 -0300
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: Enable support
 for log to debug file
In-Reply-To: <1426627803.6281.3.camel@embedded.rocks>
References: <1426197654-8183-1-git-send-email-joerg.krause@embedded.rocks>	
 <55035FF7.2070503@zacarias.com.ar> <1426627803.6281.3.camel@embedded.rocks>
Message-ID: <55089D5E.3070206@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/17/2015 06:30 PM, J?rg Krause wrote:
> For me it's +963 bytes. Force enable it anyway?

Yes, it's still negligible and the user must use the option in order for
wpa_supplicant to do anything different than what it did before it was
enabled.
Regards.
