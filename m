From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 09:38:21 +0200
Subject: [Buildroot] QtWebEngine
In-Reply-To: <FD3EC9758442224FA81FA20FD6F1AE8C648331BC@mx01.dti.lan>
References: <FD3EC9758442224FA81FA20FD6F1AE8C648331BC@mx01.dti.lan>
Message-ID: <20160906093821.530de001@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 6 Sep 2016 02:52:04 +0000, Allan Chandler wrote:

> Are there any plans in place to get QtWebEngine running in BR?
> 
> I've seen some patches that were put forward sometime last year but
> there appears to have been no recent activity on that front.
> 
> Or will QtWebKit be the web rendering engine of choice (in BR,
> obviously, not Qt) for the foreseeable future?

We definitely want qt5webengine packaged in Buildroot. As you have
seen, there have been several patches floating around to package it,
but none has been accepted so far. The last attempt was in June this
year [1], and the patch got some comments from Peter Seiderer [2] and
myself [3].

There are now at least three people interested in qt5webengine: Akihiko
Odaki, Julien Corjon, and yourself. It would be good if you could sync
up and come up with a proposal that addresses the comments that have
been made.

Thanks a lot!

Thomas

[1] http://lists.busybox.net/pipermail/buildroot/2016-June/165090.html
[2] http://lists.busybox.net/pipermail/buildroot/2016-June/165375.html
[3] http://lists.busybox.net/pipermail/buildroot/2016-August/170923.html
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
