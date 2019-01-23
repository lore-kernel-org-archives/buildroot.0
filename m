From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 16:19:45 +0100
Subject: [Buildroot] [PATCH v2 1/1] board/pc: ensure grub.cfg is copied
 to target filesystem
In-Reply-To: <20181011222445.21185-1-greg@quimbo.fr> (=?utf-8?Q?=22Gr?=
 =?utf-8?Q?=C3=A9goire?= Delattre"'s
 message of "Fri, 12 Oct 2018 00:24:45 +0200")
References: <20181011214932.350ef220@windsurf>
 <20181011222445.21185-1-greg@quimbo.fr>
Message-ID: <87womvjt9q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gr?goire" == Gr?goire Delattre <greg@quimbo.fr> writes:

 > From: Gr?goire Delattre <gregoire.delattre@gmail.com>
 > Before this commit, the grub configuration file was copied to the
 > TARGET_DIR in a post-image hook, after the filesystem has been
 > generated. It was kinda working because the board/pc's grub
 > configuration and the default one are the same and the later was
 > copied during the build process of the grub2 package.

 > This commit ensures the custom board/pc grub configuration is copied at
 > the right time.

 > Signed-off-by: Gr?goire Delattre <gregoire.delattre@gmail.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
