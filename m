From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Fri, 17 Sep 2010 19:29:50 +0200
Subject: [Buildroot] Problem running program compiled with the toolchain
In-Reply-To: <4C9278FE.2010504@signaturealpha.com>
References: <4C9278FE.2010504@signaturealpha.com>
Message-ID: <4C93A58E.9080203@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Am 16.09.2010 22:07, schrieb Marc Leclerc:
>
> I have built an x86 embedded system using buildroot 2010.08. I have been
> trying a few lib&  compiler version trying to find the problem without
> success then I added gdb to the target to see if I could get more info
>
> This app starts on my host and is recognized
> The demos do start as well
>
Hi Marc,
How did you install the application for your target? By a user defined 
package in parallel to all others in package/*?
It sound like you have build your application on and for your host - 
which might be a differtent architecture than that of your target (i386 
<> x64). Integrating your application like all other packages in the 
user land directory and booting the generated rootfs, should run your 
application - at least the simple example you gave ;-)

Regards,
Marcus
