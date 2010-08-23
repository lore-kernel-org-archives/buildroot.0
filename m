From: Massimiliano Marretta <max@marretta.com>
Date: Mon, 23 Aug 2010 08:17:37 +0200
Subject: [Buildroot] buildroot Digest, Vol 50, Issue 40
In-Reply-To: <mailman.15688.1282475011.17863.buildroot@busybox.net>
References: <mailman.15688.1282475011.17863.buildroot@busybox.net>
Message-ID: <4C721281.4010901@marretta.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Sorry for my bad english.

On 08/22/10 13:03, buildroot-request at busybox.net wrote:
> Hello Massimiliano,
>
> Thanks for reworking the patch with Git. I have a couple of comments,
> though. First, does the X.org support needs to be part of the same
> patch as the version bump ? In other words, shouldn't this be split in
> several smaller patches (one to bump the versions, one to add X.org
> support) ?
Yes the two changes are independent. I try to explain.

My needs is to use Qt in X.org environment with phonon gstreamer backend.
For this purpose is necessary to enable X.org support in gstreamer.
With the old gstreamer version, phonon have some problem to retrieve 
time information from mp3 files.
The gstreamer upgrade resolve this problem.
Now I recreate the separate patch.

> It would be good to add a little bit more details in the commit log:
> what does the X.org support brings, and what mp3 issue is being fixed
> by the version bump ?
>
> Other comments below.
/
/
