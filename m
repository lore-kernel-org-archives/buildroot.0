From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 7 Feb 2007 18:19:26 +0100
Subject: [Buildroot] Enabling Static builds
In-Reply-To: <8849503.post@talk.nabble.com>
References: <8849503.post@talk.nabble.com>
Message-ID: <20070207171926.GA30805@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 07, 2007 at 09:00:29AM -0800, Daniel Laird wrote:
>
>I have been looking at a number of the packages in the system.  Do people
>think that -enable-static is a good idea as it seems to be used in a log of
>package configures.
>would a global enable-static option and enable-shared option be good idea?
>This would mean that if you choose it it passes --enable-option to configure
>else --disable-option this could be helpful for embedded systems
>What do people think?

I don't use that myself, but from the looks we should clean this up a
bit to better support flat, no?
