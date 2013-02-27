From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Feb 2013 00:14:33 +0100
Subject: [Buildroot] setting timezone from web page
In-Reply-To: <1362001889.29197.269.camel@genx.eng.msli.com>
References: <1362001889.29197.269.camel@genx.eng.msli.com>
Message-ID: <20130228001433.6e72add5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear John Stile,

On Wed, 27 Feb 2013 13:51:29 -0800, John Stile wrote:

> If not is there a compatible zone.tab for buildroot's  /etc/TZ?
> 
> Is there a better way to do all this?

Last time I did a project that involved time zones and configurability
of time zones through a web interface, I used glibc to get the more
standard handling of time zones. You can perfectly fine use a glibc
toolchain with Buildroot.

Of /etc/TZ is *not* a Buildroot thing. It is a uClibc thing.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
