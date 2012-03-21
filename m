From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 Mar 2012 21:00:17 -0300
Subject: [Buildroot] [PATCH] libupnp: bump to version 1.6.15
In-Reply-To: <897F78579A674B10BFE5B9F2437C0F97@JohanW7>
References: <1332255248-12534-1-git-send-email-gustavo@zacarias.com.ar>
 <897F78579A674B10BFE5B9F2437C0F97@JohanW7>
Message-ID: <3de5aad31287379839debec851d4a6db@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-20 19:29, Sagaert Johan wrote:

> Hi
>
> I use libupnp without IPV6, so i think its better to create a patch
> that allows to build upnp for use without IPV6, like many other
> packages.
>
> In the past i tried other libupnp versions, the building was ok, but
> they did not work...

Hi.
Fair enough to patch it, there's only a minor #ifdef missing in 
ssdp_device.c
I've tested with ushare (not yet submitted) and an archos tablet, all 
seems dandy.
I'll resubmit a v2, please give it a try with what you link against to 
see if you have issues.
Regards.
