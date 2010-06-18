From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 18 Jun 2010 21:34:01 +0200
Subject: [Buildroot] [PATCH 05/10] module-init-tools: bump version +
	convert to autotools
In-Reply-To: <788b81e80da5dbfb884cf064b0ddf275c2fe3df0.1276454802.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 13 Jun 2010 20:50:09 +0200")
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<788b81e80da5dbfb884cf064b0ddf275c2fe3df0.1276454802.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8739wkb0eu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The "remove-index" patch is no longer needed, the newer version of
 Thomas> module-init-tools correctly uses strchr().

 Thomas> The "module-init-tools" patch, whose main purpose was to disable the
 Thomas> generation of man pages (it requires docbook2man), is replaced by a
 Thomas> simpler implementation,
 Thomas> module-init-tools-3.11-add-manpages-config-option.patch.

Looks good, don't forget to send upstream.

-- 
Bye, Peter Korsgaard
