From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Jan 2013 22:53:19 +0100
Subject: [Buildroot] [PATCH v2 3/6] libatasmart: new package.
In-Reply-To: <CAAfyv37Cd6NzPHTQmWXUS2bWB70UhA47CyWnNxD6R6igKp4Agw@mail.gmail.com>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
 <1357591399-3566-4-git-send-email-marek.belisko@open-nandra.com>
 <20130107223046.74aa74a4@skate>
 <CAAfyv37Cd6NzPHTQmWXUS2bWB70UhA47CyWnNxD6R6igKp4Agw@mail.gmail.com>
Message-ID: <20130107225319.0223451f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Belisko Marek,

On Mon, 7 Jan 2013 22:52:08 +0100, Belisko Marek wrote:

> > Could you detail a little why udev is a dependency. Is libudev a
> > dependency? Something else? We need to understand if it's a build
> > dependency, a runtime dependency, the requirement for the system to
> > actually use and run udev, etc.
> libudev is dependency for libatasmart.

Ok, then maybe put a comment on top of the "depends on
BR2_PACKAGE_UDEV".

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
