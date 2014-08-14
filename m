From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Aug 2014 09:26:58 +0200
Subject: [Buildroot] Question about buildroot
In-Reply-To: <CAOs08eWsqvHnyHhDFLM=8GpJ+m+2yWtnMySczQOuJKPYAONcyg@mail.gmail.com>
 (Fardin Pashamohamadi's message of "Wed, 13 Aug 2014 22:56:44 +0430")
References: <CAOs08eWsqvHnyHhDFLM=8GpJ+m+2yWtnMySczQOuJKPYAONcyg@mail.gmail.com>
Message-ID: <87d2c35y65.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fardin" == Fardin Pashamohamadi <fardin.pasha@gmail.com> writes:

 > Hello.
 > I build a project with buildroot for an x86 target. now how can i install this
 > output files on a target? OR which folder should i install on target??
 > Thank's.

First of all, please direct questions about buildroot to the mailing
list (buildroot at busybox.net) and not directly at me, so other people can
help you as well.

Secondly, it depends a lot on your setup. You can get buildroot to
generate an ext2/ext3/ext4 filesystem you can directly write to the
storage system of your target, or you can use the tarball destination
and extract it (as root) on your existing target filesystem. You can
also get buildroot to generate a bootloader like syslinux or grub for
you.

-- 
Bye, Peter Korsgaard
