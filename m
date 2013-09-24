From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Sep 2013 23:57:15 +0200
Subject: [Buildroot] [PATCH v2 13/17] audit: new package
In-Reply-To: <OF1C36952D.12623546-ON86257BF0.0061A062-86257BF0.0061C58C@rockwellcollins.com>
References: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>
 <1378936777-28308-14-git-send-email-clshotwe@rockwellcollins.com>
 <20130918070020.22ff8ca9@skate>
 <OF1C36952D.12623546-ON86257BF0.0061A062-86257BF0.0061C58C@rockwellcollins.com>
Message-ID: <20130924235715.47ca2a68@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Tue, 24 Sep 2013 12:47:59 -0500, Clayton Shotwell wrote:

> I have been working with the audit community to get this patch
> accepted. There is an issue with the C program not pulling in the
> correct headers when you build it for this host.  The python script
> is able to get around this issue. 

Hum this is strange because with CFLAGS_FOR_BUILD, you're supposed to
receive the correct -I arguments even for building host tools. I really
believe adding Python as a build dependency for something that already
has a nice C program to be built is not the nicest move. Of course, if
that's upstream choice, then we'll follow it, but I believe it's not
the best choice.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
