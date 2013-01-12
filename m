From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 12 Jan 2013 22:46:44 +0100
Subject: [Buildroot] [PATCH 19/28] atk: remove useless configuration
	options
In-Reply-To: <fab626bf3a29d960cffe4ceac5f04205715fc0a8.1357507764.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Jan 2013 22:29:31 +0100")
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
 <fab626bf3a29d960cffe4ceac5f04205715fc0a8.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <878v7y2hx7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> ATK is not directly related to X11, and the --with-x, --x-includes,
 Thomas> --x-libraries and --without-x options do not exist.

 Thomas> The --disable-glibtest was duplicated, and is therefore still passed
 Thomas> to the configuration options.

Committed, thanks.

-- 
Bye, Peter Korsgaard
