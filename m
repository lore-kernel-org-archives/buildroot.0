From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 May 2013 19:49:19 -0300
Subject: [Buildroot] [PATCH 6/6] gnutls: bump to version 3.2.0
In-Reply-To: <5192BC67.2070600@mind.be>
References: <1368463259-18958-1-git-send-email-gustavo@zacarias.com.ar>
 <1368463259-18958-6-git-send-email-gustavo@zacarias.com.ar>
 <5192BC67.2070600@mind.be>
Message-ID: <5192BF6F.8000800@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/14/2013 07:36 PM, Arnout Vandecappelle wrote:
>  Any reason why you want to add this config symbol, instead of just
> checking for BR2_PACKAGE_P11_KIT in the .mk file?

Other than it's usually an obscure option (probably not easy to infer
for people), not really.
Regards.
