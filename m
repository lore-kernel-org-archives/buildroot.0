From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 16:34:47 +0100
Subject: [Buildroot] Update Linux version for qemu defconfigs
In-Reply-To: <78f815d2-12e9-aded-8310-cd97a68007dd@smile.fr> (Gerome Burlats's
 message of "Tue, 29 Jan 2019 14:25:33 +0100")
References: <78f815d2-12e9-aded-8310-cd97a68007dd@smile.fr>
Message-ID: <87bm3z8oko.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gerome" == Gerome Burlats <gerome.burlats@smile.fr> writes:

 > Hi,
 > I am currently working on updating the kernel version in qemu defconfigs.

Great, thanks.

 > Is it better to update to the last stable 4.20 or use the LTS 4.19 ?

Unless there is a a specific need for 4.20 (E.G. new features), I would
prefer to stick with 4.19.x

-- 
Bye, Peter Korsgaard
