From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 11:31:32 +0200
Subject: [Buildroot] simicsfs 1.18 does not build with kernel 4.12.2
In-Reply-To: <CAEUhbmWQN1nKa17ZpUqjVcX1S78Ap6QGUBkX+1vEBKXZ+7VWcw@mail.gmail.com>
References: <CAEUhbmWTZY-zU6c_yEFpp+HR2xuGj5FiZjGVDumSrAuAg+kG5A@mail.gmail.com>
 <20170824193354.782bae38@windsurf>
 <CANQCQpY+iyQ5XtTA5tCh9V9awNa4fhGzJ+bmBdY1YWODuxjppQ@mail.gmail.com>
 <20170824230211.4c0ea814@windsurf>
 <CANQCQpY3p9GK58EE1weGjnJ1H-YwALk5nrSUQvG-UwF4RczWkw@mail.gmail.com>
 <CAEUhbmWiyHVrHdXED1nQV4Lm3JLgwmDNAUr3HiAfOMD+hLAP6A@mail.gmail.com>
 <CAEUhbmWR58b2Ykg0N1_7eS01wse=mimS+G-ZcDe=xAWMVFBOJA@mail.gmail.com>
 <20170829173709.23c345a6@windsurf.lan>
 <CAEUhbmWQN1nKa17ZpUqjVcX1S78Ap6QGUBkX+1vEBKXZ+7VWcw@mail.gmail.com>
Message-ID: <20170830113132.05c061ba@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Aug 2017 17:25:51 +0800, Bin Meng wrote:

> >> However they are moving away from the simicsfs kernel module,
> >> replacing it with the user mode Simics Agent (Matic). They've seen
> >> that the kernel module has required too much maintenance work. For
> >> this reason they don't want to encourage use of it.  
> >
> > So, we want to get rid of the simicsfs package in Buildroot ?
> 
> I think so. Since they do not want new users of SimicsFS I don't think
> we want buildroot to automatically include it. Users should move to
> the Simics Agent instead. Otherwise they will be stuck supporting
> SimicsFS.

OK. Could you send a patch dropping the Buildroot package? Don't forget
to add the relevant logic in Config.in.legacy, and the entry in the
DEVELOPERS file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
