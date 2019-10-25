From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2019 21:37:26 +0200
Subject: [Buildroot] [PATCH] package/qemu: use libusb (for usb
 passthrough) if it's selected
In-Reply-To: <20191025182852.29670-1-unixmania@gmail.com> (unixmania's message
 of "Fri, 25 Oct 2019 15:28:52 -0300")
References: <20191025182852.29670-1-unixmania@gmail.com>
Message-ID: <874kzwipl5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > This allows sharing a host USB port with the guest, which is helpful for
 > the upcoming libvirt package.

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
