From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Nov 2013 00:20:42 +0100
Subject: [Buildroot] Speeding up builds
In-Reply-To: <CAE9DZUT-G8g5cwWamULZ2ppUSOHjNf1O35diTno-uZj1_tCggA@mail.gmail.com>
References: <CAE9DZUT-G8g5cwWamULZ2ppUSOHjNf1O35diTno-uZj1_tCggA@mail.gmail.com>
Message-ID: <20131105002042.704dabfe@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dallas Clement,

On Mon, 4 Nov 2013 13:00:54 -0600, Dallas Clement wrote:

> I'm just looking for some tips on how to speed up my build times.  My
> rootfs contains many packages with lots of dependencies.  Even with 8
> fast Xeon cores, 64GB of RAM, SSDs, and SAS drives, my builds are
> taking 1 hour and 50 minutes.

Just checking: are you running these builds directly on the machine, or
are you using some kind of virtual machine?

Do you think you could provide us with your Buildroot configuration, so
we can maybe have a look?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
