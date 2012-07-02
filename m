From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Jul 2012 10:39:41 +0200
Subject: [Buildroot] [PATCH v2 1/3] pkg-infra: add XXXTARGETS_HOST macro
In-Reply-To: <1341090872-12266-1-git-send-email-arnout@mind.be>
References: <1341090872-12266-1-git-send-email-arnout@mind.be>
Message-ID: <20120702103941.2fbdf947@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sat, 30 Jun 2012 23:14:32 +0200,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> Create GENTARGETS_HOST, AUTOTARGETS_HOST and CMAKETARGETS_HOST
> macro.  Such a macro is more intuitive to use than the
> $(call ...,host) construct.  Also it speeds things up by having
> one less $(call ...) evaluation.
> 
> Also includes documentation update, but not for buildroot.html.
> 
> This brings the time for 'make -qp' (which is used by bash-completion)
> down from 1.85s to 1.35s on my laptop.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Sounds good, but didn't we agree on a different name for the package
macros? Or maybe your intention is to first get this cleanup done, and
then do the renaming?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
