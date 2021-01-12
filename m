From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2021 18:41:59 +0100
Subject: [Buildroot] [PATCHv2] package/libclc: switch to use the frozen,
 legacy mirror
In-Reply-To: <20210109211004.3108263-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 9 Jan 2021 22:10:04 +0100")
References: <20210109211004.3108263-1-yann.morin.1998@free.fr>
Message-ID: <87r1mqkq6w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The LLVM project has switched to using a monorepo to host all their
 > components. The separate, individual repositories have been closed
 > late 2020 / early 2021. The libclc repository is no longer.

 > Switch to using the libclc source from the llvm legacy and frozen
 > mirror.

 > Even though we could switch over to using the github helper, we just
 > keep using the git download method: it is a small repository, and it
 > will not impact people that were already using it.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Romain Naour <romain.naour@gmail.com>
 > Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
 > Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>

 > ---
 > Changes v1 -> v2:
 >   - keep everything as-is, just switch to the frozen mirror

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
