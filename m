From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 23:18:10 +0200
Subject: [Buildroot] Patchwork cleanup week #24
In-Reply-To: <CAJsd3zJkzAUJhvBPJ9hdQ60YmjSjuB7sahptmLFx6-1V70fLAg@mail.gmail.com>
References: <20160615220634.67eb8fa9@free-electrons.com>
 <CAJsd3zJkzAUJhvBPJ9hdQ60YmjSjuB7sahptmLFx6-1V70fLAg@mail.gmail.com>
Message-ID: <20160615231810.44fca8a1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

(Re-adding the Buildroot mailing list in Cc)

On Wed, 15 Jun 2016 13:59:03 -0700, Benjamin Kamath wrote:
> We needed the fortran / lapack patches for a project at work and I suppose
> there isn't too much interest in them in general, so feel free to mark as
> rejected.

Actually, there is some interest. We recently merged a package for
openmpi, in which we could not enable the Fortran support due to your
series not being applied.

> I'm personally much more interested in Samuel Martin's patches related to
> creating relocatable host-tools / toolchains, which I think could allow
> buildroot to much more easily create/distribute SDKs to go along with
> images.

Then, don't hesitate to review, or at least test Samuel's patches. Your
feedback is very valuable to help his series move forward. Samuel's
work is pretty complicated, so it will necessarily take some time to
get merged. But at least, it's good to know there is some interest in
this feature.

Thanks for your feedback!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
