From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 21 Aug 2013 18:52:46 -0400
Subject: [Buildroot] syslog output to serial console
In-Reply-To: <CAJpxd044gjJfXpwbMfC_3VAUU26-DgD+Sex4fACjWGszR2MjPg@mail.gmail.com>
References: <CAJpxd044gjJfXpwbMfC_3VAUU26-DgD+Sex4fACjWGszR2MjPg@mail.gmail.com>
Message-ID: <CANxTyt4NH=v26_dHGByTijLvxorD1OTqhDt-2wE45KtvSRj2uA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 21, 2013 at 4:22 PM, Bryce Schober <bryce.schober@gmail.com>wrote:

> I'd really like to redirect the rest of what gets into syslog to the
> serial console as well. Is there a way to do that with busybox syslog?
>

If you are using "logger" to to send stuff to syslog, then you can add a -s
(or --stderr) to send the messages to both syslog and stderr.

Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130821/34cf7617/attachment.html>
