From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 18:22:21 +0100
Subject: [Buildroot] [next/testing Lua modules 01/11] luarocks: add
 generation of test
In-Reply-To: <CAB0FRstu3uefmO9dvqMb=-GiAUEdm78i-ZfKX4Ho-qChH64nUg@mail.gmail.com>
References: <20190219154311.22173-1-francois.perrad@gadz.org>
 <20190328172229.51ddf155@windsurf>
 <CAB0FRstu3uefmO9dvqMb=-GiAUEdm78i-ZfKX4Ho-qChH64nUg@mail.gmail.com>
Message-ID: <20190328182221.0c60b659@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 28 Mar 2019 18:13:05 +0100
Fran?ois Perrad <francois.perrad@gadz.org> wrote:

> > Is this expected ?
> >  
> 
> Yes, more or less.
> 
> The lua ecosystem has no common policy about naming, etc...
> So, a generated stuff sometime needs a manual editing.

So for lpeg you really a special .module_test() call ?

Why is the "rings" test case not matching the output of "make
rings-upgrade" ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
