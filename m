From: Ivan Wagner <ivan.wagner@gmail.com>
Date: Fri, 28 Oct 2011 15:43:15 +0200
Subject: [Buildroot] Any plans to add ipkg/opkg to generate *.ipk/*.opk
 after package compilation?
In-Reply-To: <CA+hj=MqVuR5NMfOUWOi3Cs6ptfUpkc6SdprV-5Cx-7=ZCsCg5A@mail.gmail.com>
References: <CA+hj=Mq22h7gimL16fxF4N67X+MqU0V4Cw4jak9pFF-K=512Jg@mail.gmail.com>
 <CAAXf6LXjhix4mweM-NNqOCeVgKps+hW73Yt09P5_+NUrkFKqEg@mail.gmail.com>
 <CA+hj=MqVuR5NMfOUWOi3Cs6ptfUpkc6SdprV-5Cx-7=ZCsCg5A@mail.gmail.com>
Message-ID: <CA+hj=MpE=zPP9B3cNuPB=uvrAFuf1Rx6Ojq2scmDkb8guRsJrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Buildroot currently doesn't monitor which files are installed by each
> package. I think that this is a prerequisite for ipkg/opkg.
>
> The question was raised whether we should modify this, see the thread
> 'Some topics for the Buildroot Developer Day':
> http://lists.busybox.net/pipermail/buildroot/2011-October/046998.html
>
> The Buildroot developer day is tomorrow, Saturday. We'll have to see
> what the outcome of this topic is.
>

Hi Thomas,

thank you for your reply I really appreciate it! I read the link you
posted and I understand the various points. Did you ever take a look
at openwrt? It handles all of this within the package's makefile where
you specify which files (binaries, shared libraries, conf file etc) need to
be placed on the target. In the builds directory a package-name-ipk
folder is created (for each package being compiled) and this will be the
folder used to create the ipk/opk package. Obviously it is the make
file's responsibility to choose which file and where is has to be placed
within the package-name-ipk. However I'll see the results from the
conference.

Best regards,
Ivan Wagner
