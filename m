From: Woody Wu <narkewoody@gmail.com>
Date: Tue, 4 Dec 2012 04:44:53 +0000 (UTC)
Subject: [Buildroot] Chances in skeleton don't appear in filesystem
References: <slrnkbqn5h.1p8.narkewoody@zuhnb712.local.com>
Message-ID: <slrnkbqvsc.us1.narkewoody@zuhnb712.local.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-12-04, Woody Wu
<narkewoody@gmail.com> wrote:
> Hi, list
>
> After some intial builds, I come up with idea to make chances in the
> default filesystem contents. Then I change the config to use customized
> filesystem skeleton (fs/skeleton) and changed the
> fs/skeleton/network/interfaces with expection that change could appear
> in the generated target file system.  After another run of make,
> however, I did not see my chances by untar the rootfs.tar.bz2.  Then I
> tried to remove the output/target directory, this time I even got
> another error, 'output/target/etc/hosts: no such file or directory'.
>
> What's the correct method to modify the defualt filesystem? Thanks.
>

Sorry for typo.  'Chance' -> 'Change'

-- 
woody
I can't go back to yesterday - because I was a different person then.
