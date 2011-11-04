From: Luca Ceresoli <luca.ceresoli@comelit.it>
Date: Fri, 04 Nov 2011 12:56:33 +0100
Subject: [Buildroot] Report from the Buildroot Developer Day
In-Reply-To: <20111102160349.4afe5935@skate>
References: <20111102160349.4afe5935@skate>
Message-ID: <4EB3D2F1.3010206@comelit.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Buildroot Developer Day - ELCE 2011
> ===================================

Thomas, thanks a lot for your detailed and timely report!

> Licensing report generation
> ---------------------------

...
> It is also not clear yet what the output of this report should be. On
> one side, Thomas Petazzoni proposed that it generates an HTML document
> inside a directory with all the tarballs and all the patches for the
> different components. On the other side, Peter Korsgaard proposed that
> a report be generated, but only with a list of tarballs, leaving the
> user the work of putting the tarballs together. For Peter, there is no

I can't see any drawback of having Buildroot put together the tarballs.
It's boring for a man, and I suppose it would be easy to implement in
Buildroot.

> need to worry about the patches, since releasing Buildroot as a whole
> is sufficient to provide all the patches. Thomas, however, wasn't sure
> if releasing the Buildroot environment itself was acceptable for all
> Buildroot users as the Buildroot configuration gives quite some
> details on the system configuration. This remains to be discussed.

I think this would be illegal, at least according to the GPLv2:

   "For an executable work, complete source code means all the source
   code for all modules it contains, plus any associated interface
   definition files, plus the scripts used to control compilation and
   installation of the executable."

My understanding is that Buildroot is exactly "the scripts used to
control compilation and installation", so the patches that exist in
Buildroot should be released as well.

Luca
