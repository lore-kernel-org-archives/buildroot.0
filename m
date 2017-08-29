From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Aug 2017 17:37:09 +0200
Subject: [Buildroot] simicsfs 1.18 does not build with kernel 4.12.2
In-Reply-To: <CAEUhbmWR58b2Ykg0N1_7eS01wse=mimS+G-ZcDe=xAWMVFBOJA@mail.gmail.com>
References: <CAEUhbmWTZY-zU6c_yEFpp+HR2xuGj5FiZjGVDumSrAuAg+kG5A@mail.gmail.com>
 <20170824193354.782bae38@windsurf>
 <CANQCQpY+iyQ5XtTA5tCh9V9awNa4fhGzJ+bmBdY1YWODuxjppQ@mail.gmail.com>
 <20170824230211.4c0ea814@windsurf>
 <CANQCQpY3p9GK58EE1weGjnJ1H-YwALk5nrSUQvG-UwF4RczWkw@mail.gmail.com>
 <CAEUhbmWiyHVrHdXED1nQV4Lm3JLgwmDNAUr3HiAfOMD+hLAP6A@mail.gmail.com>
 <CAEUhbmWR58b2Ykg0N1_7eS01wse=mimS+G-ZcDe=xAWMVFBOJA@mail.gmail.com>
Message-ID: <20170829173709.23c345a6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Aug 2017 22:26:59 +0800, Bin Meng wrote:

> The latest simicsfs kernel module (v1.22) supports latest kernel, and
> is available in the simics open source package.

Is this "simics open source package" publicly available ?

> However they are moving away from the simicsfs kernel module,
> replacing it with the user mode Simics Agent (Matic). They've seen
> that the kernel module has required too much maintenance work. For
> this reason they don't want to encourage use of it.

So, we want to get rid of the simicsfs package in Buildroot ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
