From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Mar 2014 16:49:21 +0100
Subject: [Buildroot] [PATCH] rsyslog: Update patch to upstreamed version
In-Reply-To: <1395250078-16782-1-git-send-email-clshotwe@rockwellcollins.com>
 (Clayton Shotwell's message of "Wed, 19 Mar 2014 12:27:58 -0500")
References: <1395250078-16782-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <8738icx43i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Clayton" == Clayton Shotwell <clshotwe@rockwellcollins.com> writes:

 > Patch for the libgcrypt-config path correction was accepted by the
 > mainline for rsyslog. Updating the buildroot patch until a new version
 > with the fix is released.

Committed, thanks.

You forgot your signed-off-by, but as you already provided it in the
patch files I have added it here as well. Please remember it in the
future.

 > ---
 >  ...yslog-0001-libgcrypt-config-path-override.patch |   22 +++++++++++--------
 >  1 files changed, 13 insertions(+), 9 deletions(-)

 > diff --git a/package/rsyslog/rsyslog-0001-libgcrypt-config-path-override.patch b/package/rsyslog/rsyslog-0001-libgcrypt-config-path-override.patch
 > index 6af0db7..c0d8bfa 100644
 > --- a/package/rsyslog/rsyslog-0001-libgcrypt-config-path-override.patch
 > +++ b/package/rsyslog/rsyslog-0001-libgcrypt-config-path-override.patch
 > @@ -1,6 +1,6 @@
 > -From 2d498883b19c386abacffca969eb404c9407a8cc Mon Sep 17 00:00:00 2001
 > +From 86d19e4e63c3fa5b9690991f3e29ffab93990acd Mon Sep 17 00:00:00 2001
 >  From: Clayton Shotwell <clshotwe@rockwellcollins.com>
 > -Date: Mon, 10 Mar 2014 14:40:35 -0500
 > +Date: Wed, 19 Mar 2014 08:28:55 -0500
 >  Subject: [PATCH] configure: Allow overriding of libgcrypt-config
 
 >  Allow the overriding of the libgcrypt-config path if it is not at
 > @@ -8,14 +8,14 @@ a standard location.
 
 >  Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>

-- 
Bye, Peter Korsgaard
