From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jan 2013 12:52:34 +0100
Subject: [Buildroot] Problem build haserl with lua support
In-Reply-To: <1359630353.9888.41.camel@john-ubu>
References: <1359630353.9888.41.camel@john-ubu>
Message-ID: <20130131125234.166475a7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear john,

On Thu, 31 Jan 2013 11:05:53 +0000, john wrote:
> Hi,
> 
> I'm using Buildroot 2012.05 and am trying to configure haserl v0.9.X
> with lua support. I select the lua intrepreter and have not selected lua
> library modules.

You may want to update your Buildroot version, because I think the
problem have been fixed:

https://bugs.busybox.net/show_bug.cgi?id=5354

See commit 684f208ec 'lua: don't be fancy when creating shared library'.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
