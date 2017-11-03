From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Nov 2017 15:28:54 +0100
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <CA+TH9VmEJrzwPHW8c6qR5K1bN5uTTce54vm9Fpq6met2we_bMA@mail.gmail.com>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf>
 <20171102232155.11995715@windsurf>
 <CA+TH9Vkq1oPHSwTTJTzr4MdVRo6=zWMgG5pLKTsf3-ZAwhNKjw@mail.gmail.com>
 <20171103143828.4f57ab67@windsurf>
 <CA+TH9V=Uw2C7L4M0P9+uos5M66EGjLLHFFq50EqJPEGppKhV2Q@mail.gmail.com>
 <20171103145257.172edd86@windsurf>
 <CA+TH9VmEJrzwPHW8c6qR5K1bN5uTTce54vm9Fpq6met2we_bMA@mail.gmail.com>
Message-ID: <20171103152854.4cfb8076@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 3 Nov 2017 15:18:24 +0100, Angelo Compagnucci wrote:

> > But you won't be able to reproduce the problem on your PC, because your
> > PC is x86-64, and the build failure seems to be specific to building on
> > ppc64le.
> >
> > Do you have an account on the gcc compile farm ?  
> 
> Of course no.

You could ask for one, see https://cfarm.tetaneutral.net/users/new/.

> I don't think I can help here. If the problem persists,
> probably the best way is to disable mono when the host is ppc64le.

Which host platforms does mono support? Should we enable it only for
x86/x86-64 build machines?

Do you think you could report this issue upstream?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
