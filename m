From: buildrootcharles <charles.s@mercury-security.com>
Date: Thu, 28 Aug 2014 13:43:15 -0700 (PDT)
Subject: [Buildroot] Custom kernal patch not being run
In-Reply-To: <CAAXf6LVmYO+uteXmaZ5X6r1TvpM=5Z-Gez3-gERnCr_2UqzCzQ@mail.gmail.com>
References: <1409248855849-78152.post@n4.nabble.com>
 <8b3f2afb-67cb-4547-8956-fc4ed95402e5@email.android.com>
 <B9E2549378AA7A4EB6855F980A8E5B88F2EC59@MSCENT02.corp.mercury-security.com>
 <CAAXf6LVmYO+uteXmaZ5X6r1TvpM=5Z-Gez3-gERnCr_2UqzCzQ@mail.gmail.com>
Message-ID: <1409258595604-78157.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, thanks again for the reply. I have tried what you suggested will no
luck. The only message I see regarding "patch" for my "make linux-dirclean
linux" command is ">>> linux custom Download additional patches". Could this
be an issue with the configuration I have related to my custom linux
tarball? The options I have selected in the Kernel options are:

[*] Linux Kernel
    Kernel version (Custom tarball)  --->
(file:///home/MSC/linux-3.10.4-July302014.tar.gz) URL of custom ...
(/home/MSC/BuildRoot/board/xxxx/linux-custom) Custom kernel patches
    Kernel configuration (Using a custom config file)  --->
(/home/MSC/customfile.config) Configuration file path
 
No other options selected



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Custom-kernal-patch-not-being-run-tp78152p78157.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
