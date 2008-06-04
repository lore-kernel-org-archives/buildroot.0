From: Arun Reddy <reddyac@gmail.com>
Date: Wed, 4 Jun 2008 13:44:56 -0700
Subject: [Buildroot] How does an offline build work?
Message-ID: <326f33790806041344p65f55e31i3e9a507ef1176a72@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was curious as to how an offline build works.

When I first starting using Buildroot, I downloaded a snapshot for that day.
As I used that same snapshot for about a month, I would run into different
Buildroot issues, which came up whenever new changes were implemented. I
assumed that whenever I typed "make" Buildroot is automatically being
updated with those changes which could be affecting certain things.

I am now using Subversion access so I can update the source tree whenever I
want, but if I were to go back to using the Buildroot snapshot image, will
doing an offline build "make source" allow me to do a build without
Buildroot being updated? Or is it just a way for all the files, packages,
etc, to be downloaded first so that I can continue the build in a place
where I do not have network access?

Could someone clarify this? The Buildroot documentation doesn't have a
detailed explanation on how the offline build is supposed to work. Thank
you!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080604/6894a949/attachment.htm 
