From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Mar 2012 13:54:59 +0100
Subject: [Buildroot] Random build results now available online
In-Reply-To: <20120321132059.6a73658d@skate> (Thomas Petazzoni's message of
 "Wed, 21 Mar 2012 13:20:59 +0100")
References: <20120321101327.49d34f93@skate>
 <4F69BEAA.9070608@lucaceresoli.net> <20120321132059.6a73658d@skate>
Message-ID: <87iphy3yho.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Wed, 21 Mar 2012 12:42:34 +0100,
 Thomas> Luca Ceresoli <luca@lucaceresoli.net> a ?crit :

 >> Why not saving the defconfig as well?
 >> It would be easier to browse and understand (although the full
 >> config is probably better to reproduce the problem on a different
 >> commit.

 Thomas> I hesitated about this, but ok, I can add the defconfig file as well.

 Thomas> Peter, can you include a file named 'defconfig' in the tarball you
 Thomas> upload?

Ok, I've changed the script to run make savedefconfig and store that as
well.

-- 
Bye, Peter Korsgaard
