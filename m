From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 15 May 2013 19:29:42 -0400
Subject: [Buildroot] graph-depends with jpeg?
Message-ID: <CANxTyt5xEi8MTpEwh_BGhtcUo6NVZK7-z1PenKCEu+QEosQPwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Has anyone tried graph-depends with the jpeg virtual package?  I got
errored out with "Error getting dependencies".  Similarly when I tried with
a configuration that purges locales.

I'm guessing it is because these things are targets, but don't use the
generic package macros - so there's no jpeg-show-depends
or target-purgelocales-show-depends?

Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130515/aff760de/attachment.html>
