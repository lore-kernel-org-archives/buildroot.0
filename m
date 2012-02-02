From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Feb 2012 20:57:00 +0100
Subject: [Buildroot] [PATCH 1/7] Add basic config infrastructure for
	host utilities
In-Reply-To: <0a7b26f29b18560e0632a5a3bf3662028c3b75de.1327772556.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 28 Jan 2012 18:42:49 +0100")
References: <cover.1327772556.git.thomas.petazzoni@free-electrons.com>
 <cover.1327772556.git.thomas.petazzoni@free-electrons.com>
 <0a7b26f29b18560e0632a5a3bf3662028c3b75de.1327772556.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87aa519fg3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Most of the host packages don't have to be exposed to the user as they
 Thomas> are only used as build dependencies of target packages.

 Thomas> However, some host utilities, such as flashing utilities, image
 Thomas> creation programs, specific debuggers, might be useful and should be
 Thomas> presented to the user.

 Thomas> Therefore, we have a new global menu, which lists those host
 Thomas> utilities. These utilities are described in package/*/Config.in.host
 Thomas> files, which will be sourced by package/Config.in.host.

Committed, thanks.

-- 
Bye, Peter Korsgaard
