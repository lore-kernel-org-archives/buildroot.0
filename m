From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 25 Apr 2012 10:44:38 +0200
Subject: [Buildroot] [PATCH 22/22] xtensa: remove support for this
	architecture
In-Reply-To: <7fac2ee376eb5542ebd39c2eb063f773f99834a0.1334673910.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 17 Apr 2012 16:45:34 +0200")
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
 <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
 <7fac2ee376eb5542ebd39c2eb063f773f99834a0.1334673910.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87pqawcia1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The support for Xtensa has been added in July 2009, and no updates
 Thomas> have ever been done to it, and it requires some special handling, in
 Thomas> gcc/gdb, has some special Perl scripts, etc.

As discussed on IRC, I would prefer to simply mark Xtensa as deprecated
for now, and then remove in the next cycle if nothing happens.

-- 
Bye, Peter Korsgaard
