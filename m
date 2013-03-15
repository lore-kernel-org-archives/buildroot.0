From: Charles Manning <cdhmanning@gmail.com>
Date: Fri, 15 Mar 2013 13:50:46 +1300
Subject: [Buildroot] Adding a patch in a different directory
Message-ID: <CAE21AQoQPni=ck0LN1W=DRRdWWw6jjvFf9dxvX6cK5fmZV_+XQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello buildrooters

I have a situation where I am adding a patch to bluez_utils to modify
its behaviour.

If I just add the patch to package/bluez_utils/ then everything works
fine. However, we're trying to keep all our mods separate to make it
easier to track buildroot changes.

I already have a directory foo where I keep a custom skeleton, custom
packages, etc.

What I would like to do is get buildroot to use the patch in foo/patches.

Any ideas how to achieve this?

Thanks

Charles
