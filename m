From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Jan 2016 10:26:49 -0300
Subject: [Buildroot] Browser in kiosk mode
In-Reply-To: <569F7F6A.4060906@gmail.com>
References: <569F7F6A.4060906@gmail.com>
Message-ID: <569F8B19.5010304@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/01/16 09:36, Marco Trapanese wrote:

> Hi, I'm asking some hints about which is the best solution in buildroot
> to have a browser in kiosk mode with a whitelist.
> I mean, a full-screen browser, with no way to change the settings, and a
> list of allowable addresses.
>
> Firefox has a couple of plugins to achieve that but it's not included
> (yet?) in buildroot. I found this:
>
> http://lists.busybox.net/pipermail/buildroot/2012-September/058314.html
>
> I guess it won't be included soon, because the patches are there since
> 2012. Anyway I will try to use them on the latest version.
>
> Do you recommend other packages already provided in the current
> buildroot version which I could use?
> Thanks!
> Marco

Hi.
You can do that with any browser using squid in transparent mode with a 
whitelist, that way you're not tied to any particular solution (plugin, 
addon).
Regarding which browser to use that will probably depend on which 
features you want/need and which graphics platform you want to run it on 
(example: X11, pure framebuffer, EGL, so on).
Regards.
