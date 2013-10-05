From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 05 Oct 2013 10:11:27 -0300
Subject: [Buildroot] [PATCH] configs/qemu: bump relevant config versions
In-Reply-To: <87wqlsituj.fsf@dell.be.48ers.dk>
References: <1380890978-13158-1-git-send-email-gustavo@zacarias.com.ar>
 <87wqlsituj.fsf@dell.be.48ers.dk>
Message-ID: <52500FFF.9060603@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/04/2013 06:55 PM, Peter Korsgaard wrote:

> I'm not sure what went wrong here. You renamed a bunch of Linux
> configuration files, but you didn't update the defconfigs to match.
> 
> I tested arm versatile with 3.11 and it didn't boot for me, so I've
> changed the Linux configuration file names back to 3.10 rather than
> adjusting the defconfigs.

I've probably made some mistake when moving things around before doing
the commit.
That said it's working fine with 3.11.3 + qemu 1.6.0 for me, i do
extensive tests before sending this series.
I've placed some of my generated images at
https://www.zacarias.com.ar/buildroot-qemu/ if you want to give those a
try (or someone else to see if there's a pattern with qemu version or
distribution).
Maybe it's time we do a host-qemu for these to make it more
predictable/concise. There's always some breakage when there's a new
qemu version or kernel series and since we can't control which version
each distribution has it's problematic IMHO.
Regards.
