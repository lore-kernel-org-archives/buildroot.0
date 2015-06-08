From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jun 2015 12:09:07 +0200
Subject: [Buildroot] [PATCH 1/1] eudev: add cxx dependency
In-Reply-To: <CAJ4oOgzDeYod0HsYKL8hVbVUKd8G2v5zKparT0jaFE7pJBib9w@mail.gmail.com>
References: <1433616116-30527-1-git-send-email-tomasz.gorochowik@gmail.com>
 <20150606210404.GH3581@free.fr>
 <CAJ4oOgypx858taa1cef4uivge-jyS07WZ=5R2=g-w_MaVWjxMQ@mail.gmail.com>
 <XnsA4B2872B0D9DEberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <CAJ4oOgzDeYod0HsYKL8hVbVUKd8G2v5zKparT0jaFE7pJBib9w@mail.gmail.com>
Message-ID: <20150608120907.243ab639@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tomasz Gorochowik,

On Sun, 7 Jun 2015 15:13:31 +0200, Tomasz Gorochowik wrote:

> I did a build on a different machine, with a different OS and it
> indeed did work.
> 
> It turns out, that the eudev configure script was trying to execute
> the /lib/cpp binary, which was not present in my system (Arch). For
> some reason I thought it only executes the downloaded binaries while
> builduing all of the packages.
> 
> Making a symlink to that path fixed the issue, so the patch I
> submitted should clearly be ignored, as it is more of a uedev issue
> than buildroot (for executing cpp with full path instead of looking
> for it in the $PATH).
> 
> Once again - thanks for your time, and sorry for introducing the confusion.

Even though your original patch is maybe not the correct solution, I
think there is still a problem. You shouldn't have to mess up things in
your system to get Buildroot to build eudev.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
