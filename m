From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jun 2013 08:07:41 +0200
Subject: [Buildroot] Recurrent Blackfin build failure on icu
In-Reply-To: <CAJxxZ0NqXVjrO9_d6mYALXP6ktvLMxXFyc--RS9y9GVm5UkE7Q@mail.gmail.com>
References: <20130529213510.43fc1372@skate>
 <CAJxxZ0MzWeQ4USQbwNwAuxGpkvwcejqaZvC7bGpySrZCdzus+g@mail.gmail.com>
 <20130603113857.0c7ff74a@skate>
 <CAJxxZ0NqXVjrO9_d6mYALXP6ktvLMxXFyc--RS9y9GVm5UkE7Q@mail.gmail.com>
Message-ID: <20130606080741.3db86d59@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Thu, 6 Jun 2013 10:32:27 +0800, Sonic Zhang wrote:

> > Can this specific behavior of the Blackfin toolchain be detected? Is
> > there a typical autotools test that would allow to test this?
> >
> 
> Maybe you can check the symbol name after compiling a C file into an
> assembly file?

Good idea, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
