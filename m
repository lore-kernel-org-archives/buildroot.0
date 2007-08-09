From: Brad House <brad@mainstreetsoftworks.com>
Date: Wed, 08 Aug 2007 20:59:15 -0400
Subject: [Buildroot] [patch] add mdnsresponder package
Message-ID: <46BA66E3.7010407@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mDNSResponder is a component of Bonjour, Apple's initiative for
zero-configuration networking.  More information is available
here:

http://developer.apple.com/networking/bonjour/index.html

This appears to be lighter-weight than avahi and has basically
no dependencies other than uclibc itself.  The avahi package
needed some patches to even compile then crashed when I tried
to run it.  I'd prefer to use something smaller anyhow, and
this appears to fit the bill quite well...

The patch below adds support to buildroot for mdnsresponder,
including the config file template and initialization script.

-Brad

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: mdnsresponder.diff
Url: http://busybox.net/lists/buildroot/attachments/20070808/d1049972/attachment.diff 
