From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 09:20:28 +0100
Subject: [Buildroot] [PATCH 1/1] erlang: bump to version 20.0
In-Reply-To: <CA+-urNSgFcRjQz1pce9iG-7dxw0_BLC5M1Jt6cvLamqfarstGw@mail.gmail.com>
References: <20171130154202.437-1-johan.oudinet@gmail.com>
 <CA+-urNSgFcRjQz1pce9iG-7dxw0_BLC5M1Jt6cvLamqfarstGw@mail.gmail.com>
Message-ID: <20171201092028.6ebf91b6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Nov 2017 11:31:53 -0500, Frank Hunleth wrote:

> On Thu, Nov 30, 2017 at 10:42 AM, Johan Oudinet <johan.oudinet@gmail.com> wrote:
> >
> > This change bumps the Erlang version from 19.3 to 20.0. As a new major
> > release, there are a few incompatibilities. Details are here:
> > http://www.erlang.org/news/114  
> 
> Thanks for doing this. I had been holding on to a nearly identical
> patch, but it breaks several erlang packages currently in Buildroot.

What are those packages ?

> It didn't look easy to fix, and then I got busy. As I'm sure that
> you're aware, ejabberd builds fine. I don't think there are many of us
> Erlang/Buildroot users, so if this still breaks erlang packages that
> you don't use, I'm fine with removing them.

We definitely need to at least identify those packages. Is this a build
time breakage ? Run-time breakage ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
