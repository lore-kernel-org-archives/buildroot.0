From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 2 Mar 2017 11:07:55 -0800
Subject: [Buildroot] [PATCH] ncftp: fix host/target confusion
In-Reply-To: <877f47hccp.fsf@dell.be.48ers.dk>
References: <1488322477-25447-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170301214800.1a6c3405@free-electrons.com> <877f47hccp.fsf@dell.be.48ers.dk>
Message-ID: <CANxTyt6tGknGoHc2swaeqh-h6L740Ny79UwgH4AqQH2SfjQYnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Thu, Mar 2, 2017 at 8:28 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
> Hi,
>
>  > Applied to master, thanks. Peter, I believe this one qualifies for the
>  > LTS branch.
>
> Committed to 2017.02.x, thanks.

Are you able to download this tarball with the hash indicated in
ncftp.hash?  I keep getting an error:

ERROR: ncftp-3.2.6-src.tar.xz has wrong sha256 hash:
ERROR: expected:
7abd3e8f848f0efb4bb6a4bc5da58a59524d4378fc8d70a52adb0fe1fd00b89d
ERROR: got     :
5f200687c05d0807690d9fb770327b226f02dd86155b49e750853fce4e31098d
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Danomi -


> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
