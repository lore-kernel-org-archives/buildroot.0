From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 21 Jan 2017 13:27:29 -0200
Subject: [Buildroot] Adding kmscube support
In-Reply-To: <CAOMZO5Az55JR=3ao1d5khYTtybqeJZXK8SkTDB_kxfmGQvEPyQ@mail.gmail.com>
References: <CAOMZO5BDx6SqN-ZxU+ogJNetjtZhDqWrF0cB5YhqC7pW3NwaSA@mail.gmail.com>
 <CAOMZO5AYjEb56ErnvnAQ-PA4xtZb_97BsGyqYRF2tWSj+Osi-A@mail.gmail.com>
 <CAOMZO5DdVzn6+p3vDqjRXt=a28NVNAOw84H=-d8zio_J9gyNLg@mail.gmail.com>
 <87y3y4pnrk.fsf@dell.be.48ers.dk>
 <CAOMZO5Az55JR=3ao1d5khYTtybqeJZXK8SkTDB_kxfmGQvEPyQ@mail.gmail.com>
Message-ID: <CAOMZO5CSA9UfZ9TNb249EPRaR+M57pby+LbTbEg0Fj0W=OAvEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 21, 2017 at 12:37 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Peter,
>
> On Sat, Jan 21, 2017 at 11:04 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>
>> This is handled through the the BR2_PACKAGE_HAS_LIBGLES / libgles
>> virtual package (as we have several packages providing GL support).
>>
>> See E.G. the efl or cairo packages for examples. You might also be
>> missing our pkg-config (add host-pkgconf to dependencies).
>
> Thanks for the hints. Selecting BR2_PACKAGE_MESA3D_OPENGL_ES=y did the trick.
>
> kmscube builds, but there is one gbm issue I need to investigate:

Managed to fix it. kmscube is running fine on mx6 now :-)

Will submit the etnaviv mesa patches when the final mesa 17.0.0 is out.

Thanks
