From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 30 Jan 2014 14:03:37 -0300
Subject: [Buildroot] [PATCH 2/6] php: fix for external extensions
In-Reply-To: <87k3dhtod4.fsf@dell.be.48ers.dk>
References: <1390944391-3892-1-git-send-email-gustavo@zacarias.com.ar>	<1390944391-3892-2-git-send-email-gustavo@zacarias.com.ar>	<87ob2ttpro.fsf@dell.be.48ers.dk>
 <52EA7AC5.7040905@zacarias.com.ar> <87k3dhtod4.fsf@dell.be.48ers.dk>
Message-ID: <52EA85E9.4060109@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/30/2014 01:40 PM, Peter Korsgaard wrote:

> Ok - So to conclude, we need the manual php-config change, but the
> phpize change can be done with PHP_CONFIG_SCRIPTS?

It works... for now... i'm a bit wary of doing so since it's just casual
that it works with _CONFIG_SCRIPTS without it being a config script, if
upstream changes things in a newer php version it may break.
Regards.
