From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 29 Jun 2013 09:42:15 -0400
Subject: [Buildroot] using a variable within a buildroot menuconfig
In-Reply-To: <87txkj3fl8.fsf@dell.be.48ers.dk>
References: <51C94D88.5080707@gmail.com> <51C9D5C5.4090409@mind.be>
 <87txkj3fl8.fsf@dell.be.48ers.dk>
Message-ID: <CANxTyt5QFrhLW__jV4+HKPGjDvvZwfh9KMcwWP1JK6bpB-oHEA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 27, 2013 at 8:25 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> FYI, I'm currently looking at more-or-less the same horror, E.G. the
> 1.6G ezsdk blob for ti81xx.


I too am a victim of the ti81xx EZSDK horror.  I've been compiling the
EZSDK on its own, doing a "make install EXEC_DIR=/some/place", and then
using a script to selectively pull stuff out of the created install tree
into something like a target skeleton overlay that gets installed into
staging as well.  It works, but stinks for source control.  (Check in the
whole 1.6G, most of which is worthless and takes a long time to compile, or
check in the resulting overlay, which feels hacky?)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130629/76c47d20/attachment.html>
