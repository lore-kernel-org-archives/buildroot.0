From: Carlos Santos <unixmania@gmail.com>
Date: Thu, 24 Oct 2019 15:07:41 -0300
Subject: [Buildroot] [PATCH v6] package/libvirt: new package
In-Reply-To: <CANQCQpbhMc6RAykK715Sc5oZ5CJDiD-wrUfqBQWkh-Gvd=Ov5w@mail.gmail.com>
References: <20191024145817.3559-1-unixmania@gmail.com>
 <CANQCQpbhMc6RAykK715Sc5oZ5CJDiD-wrUfqBQWkh-Gvd=Ov5w@mail.gmail.com>
Message-ID: <CAJ4jsadpMr2yNZYGJKiU0wgq0gZHJTcD45hqTQ_Rjv967Jcz8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 24, 2019 at 1:57 PM Matthew Weber <matthew.weber@collins.com> wrote:
>
> Carlos,
>
> On Thu, Oct 24, 2019 at 9:59 AM <unixmania@gmail.com> wrote:
> >
> > From: Carlos Santos <unixmania@gmail.com>
> >
> > Libvirt is collection of software that provides a convenient way to
> > manage virtual machines and other virtualization functionality, such as
> > storage and network interface management. These software pieces include
> > an API library, a daemon (libvirtd), and a command line utility (virsh).
> >
> >    http://libvirt.org/
> >
> > Thanks-to: DATACOM for providing hardware and software tools used to
> >            develop and test this package.
> >            https://www.datacom.com.br/en/produtos/network-appliance
> >
>
> What's a good test approach to get you feedback on this series?
>

I will send a patch that creates a test vm image and contains and
instructions to use it to test libvirt.

-- 
Carlos Santos <unixmania@gmail.com>
