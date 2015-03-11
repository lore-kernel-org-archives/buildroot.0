From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Mar 2015 18:45:13 -0300
Subject: [Buildroot] Reduce toolchain options
In-Reply-To: <87a8zjjjqi.fsf@dell.be.48ers.dk>
References: <550069E9.5060403@zacarias.com.ar>	<20150311214543.597e639b@free-electrons.com>
 <87a8zjjjqi.fsf@dell.be.48ers.dk>
Message-ID: <5500B769.6060801@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/2015 06:40 PM, Peter Korsgaard wrote:
> Yeah, it is potentially useful for tiny initramfs'es with only busybox
> and similar stuff, but not for anything bigger.

I'll cook the non-LFS killer patchset and send it and wait for opinions
on the others.
Regarding toolchains i'll keep the check for external ones to avoid
noise when an improper one is used.
Regards.
