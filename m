From: Erik Andersen <andersen@codepoet.org>
Date: Fri, 26 Jan 2007 22:06:39 -0700
Subject: [Buildroot] can't compile ccache with static uClibc
In-Reply-To: <45BA7434.3010404@hp.com>
References: <45BA7434.3010404@hp.com>
Message-ID: <20070127050639.GA23033@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri Jan 26, 2007 at 02:35:48PM -0700, Eric Schwartz wrote:
> I'm actually working on xm-test, a xen testing tool, but it uses 
> buildroot to create a disk
> image for things like creating guests, running small programs in them, 
> that sort of thing.  The platform I'm working on is a bit unusual for 
> buildroot-- ia64-- and uClibc does not, to the best of my current 
> knowledge, compile a shared library for ia64, only static.
> 
> I added ia64 to the toplevel Config.in file like so:

Were you using uClibc 0.9.28 or the latest uClibc snapshot?

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
