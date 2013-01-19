From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 19 Jan 2013 19:19:40 +0100
Subject: [Buildroot] post-build script is called before rootfs tweaking
In-Reply-To: <50FAD374.9010306@relinux.de> (Stephan Hoffmann's message of
 "Sat, 19 Jan 2013 18:10:12 +0100")
References: <50FAD374.9010306@relinux.de>
Message-ID: <871udhghmr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:

 Stephan> Hello,
 Stephan> buildroot's documentation says:
 >> In the Buildroot configuration, you can specify the path to a
 >> *post-build script*, that gets called /after/ Buildroot builds all the
 >> selected software, but /before/ the rootfs packages are assembled.
 Stephan> I understand this the way that the post-build script is called as the
 Stephan> last action before package assembly.

 Stephan> Is this a bug or a feature? I'd prefer having the script
 Stephan> called after the target directory is completely set up.

I would call it a bug. I recently fixed up a similar issue with the
passwd handling happening after the post-build script.

Care to send a patch to fix it?

-- 
Bye, Peter Korsgaard
