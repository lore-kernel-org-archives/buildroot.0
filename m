From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Tue, 22 Mar 2016 18:11:59 +0100
Subject: [Buildroot] [PATCH v2 1/1] gnuradio: fix compilation with
 cmake-3.5
In-Reply-To: <tm98scxncf.ln2@ID-313208.user.individual.net>
References: <1458646304-339-1-git-send-email-gwenj@trabucayre.com>
 <tm98scxncf.ln2@ID-313208.user.individual.net>
Message-ID: <20160322181159.600222f8@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 22 Mar 2016 17:50:05 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Hi Gwenhael,
> 
> Am Tue, 22 Mar 2016 12:31:44 +0100 schrieb Gwenhael Goavec-Merou:
> 
> > fix:  
> 
> > http://autobuild.buildroot.net/results/  
> ddee04bf8c477fb8ae6fe7f15b112485797dd96e/
> 
> Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> (compile tested)
> 
> > fix partially :
> > 
> > http://autobuild.buildroot.net/  
> results/33748edd3555296c1d8a8b49c83bca6003781993/
> 
> This defconfig compiles with this additional patch from cmake release 
> branch applied:
> https://github.com/Kitware/CMake/commit/
> e2f387fabbf6af84444665b88b8933ef5ed5cb59
> 
> Regards, Bernd
> 
Hi Bernd,

according to FindBoost.cmake boost_threads depends on atomic & chrono.
I think (I'm test before sent a patch) it's better to add the missing
dependencies. No ?

Regards, Gwen
