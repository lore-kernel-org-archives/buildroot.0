From: James Knight <james.knight@rockwellcollins.com>
Date: Wed, 16 Dec 2015 20:36:26 -0500
Subject: [Buildroot] [PATCH 1/4] libcairomm: new package
In-Reply-To: <20151216224558.0855b564@free-electrons.com>
References: <1449178605-8568-1-git-send-email-james.knight@rockwellcollins.com>
 <20151216224558.0855b564@free-electrons.com>
Message-ID: <CALe+oY_R1++xZWeZbv9E1LuWoUi76DxEOOeE2zPgs151krSS0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Dec 16, 2015 at 4:45 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> I've applied, but quite a few changes were needed:
>

First off, thanks (as well as for related commits).


> I was a bit surprised by the missing dependency on libsigc.
>

My apologies. I am surprised I messed that as well. No excuse; I'll have to
rework how I check things but I submit stuff upstream.

I have one question about the following though:


>      - rename package from libcairomm to cairomm in order to match
>        upstream name.
>

Was this changed to match existing Buildroot's packages naming style or
something else? I was trying to make sure I selected the right name for
these packages; a bit frustrated that I messed up on this as well. I guess
I started with trying to match gtkmm's package to gtk's packages seen in
Buildroot (ie GTK 2 is libgtk2 and not gtk2), then followed suit with the
package dependencies I was adding. I guess my main question is why the GTK
packages are named libgtk2/libgtk3 over gtk2/gtk3?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151216/ce7e4fbf/attachment.html>
