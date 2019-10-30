From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 13:30:06 +0100
Subject: [Buildroot] [PATCH] docs/manual: clarify the reinstallation of
 a package
In-Reply-To: <20191016195444.2408065-1-vivien.didelot@gmail.com> (Vivien
 Didelot's message of "Wed, 16 Oct 2019 15:54:44 -0400")
References: <20191016195444.2408065-1-vivien.didelot@gmail.com>
Message-ID: <87o8xy1kmp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vivien" == Vivien Didelot <vivien.didelot@gmail.com> writes:

 > Since <package>-rebuild implies <package>-reinstall and
 > <package>-reconfigure implies <package>-rebuild, it is confusing
 > to mention the make and make <package> commands when describing
 > the restart of the configuration, compilation and installation of
 > the package.

 > Therefore remove the ", followed by +make+ or +make <package>+"
 > portions in the "8.3. Understanding how to rebuild packages" section,
 > and add a new paragraph clarifying how to include the rebuilt package
 > in the filesystem image, if that is necessary.

 > Signed-off-by: Vivien Didelot <vivien.didelot@gmail.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
