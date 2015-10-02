From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Oct 2015 22:29:46 +0200
Subject: [Buildroot] [PATCH 1/5] package/freerdp: bump to master
In-Reply-To: <4e62ce63a1a98b7ad9a341e02310759e1c954b9c.1441569038.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 6 Sep 2015 21:54:18 +0200")
References: <cover.1441569038.git.yann.morin.1998@free.fr>
 <4e62ce63a1a98b7ad9a341e02310759e1c954b9c.1441569038.git.yann.morin.1998@free.fr>
Message-ID: <878u7lf1z9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, we're packaging FreeRDP from the stable-1.1 branch, which has
 > not evolved since march 2015 and hasn't seen any release (not even a
 > tag) since July 2013. It is by all purpose and means, dead.

 > Other packages that may use FreeRDP (like weston) are now migrating to,
 > or have already migrated to using the API from master, which has changed
 > a bit from what was available on the stable-1.1 branch. So, those
 > packages now FTBFS.

 > However, FreeRDP still has not done a release from their master branch;
 > the last tag dates back to September 2014 and there are 1850+ changes on
 > top of that tag.

 > So, switch to using the currently-latest commit from master.

 > This version can also use gstreamer-1.x (in addition to gst-0.x), which
 > needs quite some rework on how we handle the dependency on gstreamer.
 > Drop gstreamer support entirely, support for gst-0.x and gst-1.x will be
 > re-added in a followup patch.

 > Similarly, a wayland client can now be built, support for which will
 > be added in a subsequent path; it is currently forcibly disabled.

 > The way the libraries are built has changed: the previous single library
 > has been split in multiple libraries, each implementing parts of the RDP
 > protocol.

 > Slight rewording of the prompts:
 >   - drop the 'install' for client and server.
 >   - drop 'freerdp' from the client and server comment

 > The location of the server keys has changed, so copy them from the new
 > location.

 > Finally, drop patches 1 and 3, applied upstrem; rename remaining
 > patches.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
