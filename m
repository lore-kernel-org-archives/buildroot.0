From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 29 Aug 2014 20:07:11 +0200
Subject: [Buildroot] Custom kernal patch not being run
In-Reply-To: <1409258595604-78157.post@n4.nabble.com>
References: <1409248855849-78152.post@n4.nabble.com>
 <8b3f2afb-67cb-4547-8956-fc4ed95402e5@email.android.com>
 <B9E2549378AA7A4EB6855F980A8E5B88F2EC59@MSCENT02.corp.mercury-security.com>
 <CAAXf6LVmYO+uteXmaZ5X6r1TvpM=5Z-Gez3-gERnCr_2UqzCzQ@mail.gmail.com>
 <1409258595604-78157.post@n4.nabble.com>
Message-ID: <CAAXf6LWNgNNArj9eNs2ANESZsmm970cjkce9-+VxdmXNSJ9sjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Charles,

On Thu, Aug 28, 2014 at 10:43 PM, buildrootcharles
<charles.s@mercury-security.com> wrote:
> Thomas, thanks again for the reply. I have tried what you suggested will no
> luck. The only message I see regarding "patch" for my "make linux-dirclean
> linux" command is ">>> linux custom Download additional patches". Could this
> be an issue with the configuration I have related to my custom linux
> tarball? The options I have selected in the Kernel options are:
>
> [*] Linux Kernel
>     Kernel version (Custom tarball)  --->
> (file:///home/MSC/linux-3.10.4-July302014.tar.gz) URL of custom ...
> (/home/MSC/BuildRoot/board/xxxx/linux-custom) Custom kernel patches
>     Kernel configuration (Using a custom config file)  --->
> (/home/MSC/customfile.config) Configuration file path
>
> No other options selected
>

Which version of Buildroot are you using? Is this a recent release?

Also, please send us your .config so we can try to reproduce.

The message 'Downloading additional patches' should not appear for
local patches, i.e. those that are in a directory, but only for http
or ftp patches.

Best regards,
Thomas
