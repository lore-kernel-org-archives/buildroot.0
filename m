From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2011 13:55:28 +0100
Subject: [Buildroot] alsa-utils and nctp troubles with 2011.02
In-Reply-To: <F41B82AC38A41A41868925971DCBED9E06EEB9EE@rfomb01.corp.atmel.com>
References: <F41B82AC38A41A41868925971DCBED9E06EEB9E9@rfomb01.corp.atmel.com>
	<20110308111936.0802c04e@surf>
	<F41B82AC38A41A41868925971DCBED9E06EEB9EE@rfomb01.corp.atmel.com>
Message-ID: <20110308135528.494c0a89@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ludovic,

On Tue, 8 Mar 2011 12:40:19 +0100
"Desroches, Ludovic" <Ludovic.Desroches@atmel.com> wrote:

> Sorry for the probably bad reply format, I have troubles with my
> usual mail client.

Ouch, yes, bad reply format :-)

> Thank you for these answers, the problem was coming from too old cp
> (5.97)and tar (1.16) commands. My host distribution is a Debian 4.0.
> I have replaced them with more recent version and everything works
> fine.

Ok, good to know. Debian 4.0 is no longer supported by the Debian
project itself since February 2010, so I don't think it's really worth
the effort to support Debian 4.0 as the host distribution in Buildroot.

Peter, your opinion ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
