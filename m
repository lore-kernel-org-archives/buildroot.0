From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Feb 2013 18:31:48 +0100
Subject: [Buildroot] Adding a ModemManager package
In-Reply-To: <51210E6F.6000504@gmail.com>
References: <51210E6F.6000504@gmail.com>
Message-ID: <20130217183148.2cc7dd92@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Shawn J. Goff,

On Sun, 17 Feb 2013 12:07:59 -0500, Shawn J. Goff wrote:
> I'm trying to add a ModemManager package. While building, I'm getting 
> this error during the installation step: "/usr/lib/libgcc_s.so: file not 
> recognized: File format not recognized". This looks like it's looking at 
> my host's libgcc_s.so instead of the target's version. If that's the 
> case I'm not sure why or how to fix it. I did have to use autogen.sh to 
> create the configure script and lots of other stuff; I did this on my 
> host system, so I'm not sure if that is affecting it.

Could you post the in-progress patch you have to add the modem-manager
package? This would allow us to check for potential suspicious things
in the .mk file, and if nothing suspicious shows up, to try and
reproduce the issue.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
