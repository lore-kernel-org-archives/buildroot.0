From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 17:41:49 +0200
Subject: [Buildroot] [PATCH] tcl: rework logic for databases support
In-Reply-To: <56FBF32C.7070802@imgtec.com>
References: <1459351282-16091-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160330173503.2e710605@free-electrons.com>
 <56FBF32C.7070802@imgtec.com>
Message-ID: <20160330174149.5325020f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Mar 2016 16:39:24 +0100, Vicente Olivert Riera wrote:

> We remove sqlite unconditionally because we don't want to use the
> bundled version.

Yes, explain this in a comment :)

> For tdbcodbc I don't have any particular reason to remove it or keep it.
> What do you prefer?

If it was already removed before your patch, keep it this way.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
