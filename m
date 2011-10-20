From: Dechesne, Nicolas <n-dechesne@ti.com>
Date: Thu, 20 Oct 2011 15:09:27 +0200
Subject: [Buildroot] [PATCH v2] New package: parted
In-Reply-To: <20111020150704.29bc1398@skate>
References: <4E9FC67B.7030109@visionsystems.de>
 <CALB96N=4OwW95SoxHHusOBR9oQTuQ6uN_1swzkGqoF1q71YC0Q@mail.gmail.com>
 <20111020150704.29bc1398@skate>
Message-ID: <CALB96NnSWS1j6womkANfR=-sExSiK=EGckjbnDr8v0WqvsR-RQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 20, 2011 at 3:07 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

>
> $(eval $(call AUTOTARGETS))
> $(eval $(call AUTOTARGETS,host))
> $(eval $(call GENTARGETS))
> $(eval $(call GENTARGETS,host))
>
> And the package infrastructure will figure out automatically the
> package name and the package directory.
>

this is cool. so someone has to update all packages ;-)


>
> Next week, I'll be in Prague, where I will physically meet Peter.


i will be there as well ;-)


> And I
> intend to use this opportunity to use whatever method happens to be
> necessary to have him merge the asciidoc documentation patches so that
> we can work on improving the documentation! :-))
>
> Or maybe I should start a fund-raising campaign from Buildroot
> contributors to buy enough beers to Peter so that he gets drunk enough
> to blindly merge all our patches. Who's contributing ? :-)
>

sounds like a plan!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111020/4de0b090/attachment.html>
