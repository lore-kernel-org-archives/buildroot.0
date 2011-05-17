From: Diego Iastrubni <diegoiast@gmail.com>
Date: Tue, 17 May 2011 16:45:20 +0300
Subject: [Buildroot] Slow boots caused by
 ca520507fc15a8213334a76339a3e6d567e91ea0 (udev, inittab)
In-Reply-To: <20110517152841.2da7be8c@surf>
References: <BANLkTi=cikrdVk_mikRhpLYZtgDarZCukw@mail.gmail.com>
	<20110517152841.2da7be8c@surf>
Message-ID: <BANLkTinfxAON7FioeoC9scz9MF9F3fVp+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 17, 2011 at 4:28 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Well inittab does "mount -a" and /etc/fstab says that sysfs should be
> mounted.
Noted. My inittab does contain those line... and the ininttab does
contain "mount -a"...


> Moreover the ca520507fc15a8213334a76339a3e6d567e91ea0 you're pointing
> did not change the inittab, so I don't know how reverting could modify
> the inittab. Are you referring to the udev startup script ?
I reverted S10udev of course.
How can I debug this?
