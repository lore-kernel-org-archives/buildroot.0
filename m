From: Ravi Kumar Kulkarni <ravilinux4u@gmail.com>
Date: Mon, 26 Apr 2010 13:09:52 +0545
Subject: [Buildroot] /dev/bus/usb on BR
In-Reply-To: <87pr1m4r4e.fsf@macbook.be.48ers.dk>
References: <p2l630286c71004252341l5ed447f0sd5cb0c0bf3c68a75@mail.gmail.com>
	<m2k532dd5841004252352jdc881088y588d57d5fbde19a6@mail.gmail.com>
	<87pr1m4r4e.fsf@macbook.be.48ers.dk>
Message-ID: <i2s532dd5841004260024r41596833pd07cced09efc5c28@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 26, 2010 at 1:05 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Ravi" == Ravi Kumar Kulkarni <ravilinux4u@gmail.com> writes:
>
> Hi,
>
> ?Ravi> sometimes the buildroot doesnt create nodes in /dev/sda1 or
> ?Ravi> /dev/bus/ create manually by using mknod with device major n
> ?Ravi> minor no from Documentation/devices.txt from the kernel source
> ?Ravi> which u are running on target.
>
> What do you mean? At BR compile time (static device nodes) or at runtime
> using udev/mdev?

i meant at BR compile time (static device nodes) from device table
(target/device/Atmel/root/device_table.txt).im using at91sam9261ek.
even though there is  sda1,sda2  in  device table but on  my target
/dev/dir it was not there.
warm regards,
Ravi Kulkarni.
