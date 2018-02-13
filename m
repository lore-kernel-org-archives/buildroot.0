From: Pierre <pinaraf@pinaraf.info>
Date: Tue, 13 Feb 2018 23:02:17 +0100
Subject: [Buildroot] [PATCH 1/1] Add first KF5 packages
In-Reply-To: <20180213225342.006e1b37@windsurf.lan>
References: <20180213213531.22910-1-pinaraf@pinaraf.info>
 <20180213225342.006e1b37@windsurf.lan>
Message-ID: <1561654.yogy4a9DAU@peanuts2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, February 13, 2018 10:53:42 PM CET Thomas Petazzoni wrote:
> Hello,
> 
> Thanks a lot for this contribution! And for showing up on IRC! :-)
> 
> On Tue, 13 Feb 2018 22:35:31 +0100, Pierre Ducroquet wrote:
> > KDE Frameworks 5 is a set of libraries built on the Qt framework providing
> > a lot of powerfull classes and solutions for developers building Qt
> > applications.
> > Unlike the previous KDE libraries, they are split in tiny packages,
> > reducing dependencies as much as possible, making them usable even for
> > embedded projects.
> > 
> > This first commit introduce the kf5 packages folder and the first two KF5
> > packages:
> > - ecm - Extra CMake modules, addons for CMake used across the KF5
> > libraries
> > - NetworkManagerQt - a Qt wrapper for the NetworkManager DBus API
> > 
> > Signed-off-by: Pierre Ducroquet <pinaraf@pinaraf.info>
> 
> Thanks for this contribution! See some comments below.

Hello

You're welcome, and thanks for the comments. I will follow your suggestions, 
split the patch and do some fixes.
You understood correctly the purpose of extra-cmake-modules, it installs 
nothing on the target, it's only host files automatically picked by CMake.
The new patches should be ready by tomorrow.

 Pierre
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180213/a8f01bf6/attachment.asc>
